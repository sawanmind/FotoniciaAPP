//
//  LoginViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 29/05/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var textfieldEmailorPhoneNumber: UITextField!
    @IBOutlet weak var textFieldpassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textFieldpassword.delegate = self

    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textFieldpassword                                                              .endEditing(true);
        return false;
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textFieldpassword.resignFirstResponder()
        return true;
    }
    
    //textfield func for the touch on BG
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - @IBOutlet Action
    
    
    
    func setRootViewController() {
        let storyboardLogin = UIStoryboard(name: "HomeView", bundle: nil)
        
        if let logingNaviagationController = storyboardLogin.instantiateViewController(withIdentifier: "HomeViewNavigationController") as? UINavigationController{
            if let vc = storyboardLogin.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController{
                //                let appDelegate = UIApplication.shared.delegate
                logingNaviagationController.viewControllers = [vc]
                //
                //                appDelegate?.window??.rootViewController = vc
                //                appDelegate?.window??.makeKeyAndVisible()
                
                self.present(logingNaviagationController, animated: false, completion: {
                    
                })
            }
        }
    }
    
    @IBAction func btnForgetPassword(_ sender: Any) {
        
        let alertController: UIAlertController = UIAlertController(title: "FORGOT PASSWORD", message: nil, preferredStyle: .alert)

        var emailOrPhone = ""
        let submitAction = UIAlertAction(title: "SUBMIT", style: .default) { [weak alertController] _ in
            if let alertController = alertController {
                let loginTextField = alertController.textFields![0] as UITextField
                emailOrPhone = loginTextField.text!
                self.forgetPassword(emailOrPhone: emailOrPhone)
            }
        }
        submitAction.isEnabled = false
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        
        alertController.addTextField { textField in
            textField.placeholder = "Email id or Phone number"
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange, object: textField, queue: OperationQueue.main) { notification in
                submitAction.isEnabled = textField.text != ""
            }
        }

        alertController.addAction(submitAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func forgetPassword(emailOrPhone: String) {
        let dicUserDetails :[String:Any] = ["username" : emailOrPhone]
        
        let dicParams:[String : Any] = ["user_details" : dicUserDetails, "hash_key" : ""]
        print("Dic parameters: \(dicParams)")

        RequestManager().forgetPassword(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
                let alert = UIAlertController(title: "", message: "Password Reset succesfully", preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                    if let response = responseModel as? [String : Any] {
                    }
                })
                alert.addAction(actionOK)
                self.present(alert, animated: true, completion: {
                })
            }else{
                self.alert(message: "Password Reset Not succesfully", title: "")
                print(error?.localizedDescription as Any)
            }
        }

        
        //        RequestManager().forgetPassword(dicParams, loader: true) { (status, responseModel, error) in
        //            print(responseModel)
        //        }
    }

    @IBAction func btnBackAction(_ sender: Any)
    {
        self.dismiss(animated: true) {
            print("Controller dismissed")
        }

    }

    @IBAction func btnLoginFacebookAction(_ sender: Any)
    {
        self.facebookLogin()

    }
    @IBAction func btnLoginGoogleAction(_ sender: Any)
    {
       self.googleLogin()
    }
    @IBAction func btnLoginAction(_ sender: Any)
    {
        if !self.textfieldEmailorPhoneNumber.text!.isValidEmail(testStr: self.textfieldEmailorPhoneNumber.text!)
        {
            self.alert(message: Constant.AlertMessage.SigninAndSignup.ValidEmail, title: "")
        }else if !self.textFieldpassword.text!.isPasswordLenthCorrect(password: self.textFieldpassword.text!){
            self.alert(message: Constant.AlertMessage.SigninAndSignup.PasswordLenghtLimit, title: "")
        }else {
            self.login()
        }
    }
    
     //MARK: Server Communication
    
    
    
    
    func login() {
        
        let dicUserDetails :[String:Any] = ["username" : self.textfieldEmailorPhoneNumber.text!, "password" : self.textFieldpassword.text!, "social_id" : "0", "login_type" : "0"]
        
        let dicParams:[String : Any] = ["user_details" : dicUserDetails, "device_info" : Device.deviceInfo(), "hash_key" : ""]
        print("Dic parameters: \(dicParams)")
        
        
        RequestManager().login(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status{
                let alert = UIAlertController(title: "", message: "Login succesfully", preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                    if let response = responseModel as? [String : Any] {
                        UserDefaults.saveUserInfo(userInfo: response)
                    }
                    self.setRootMenuView()
                })
                alert.addAction(actionOK)
                self.present(alert, animated: true, completion: {
                })
            }else{
                self.alert(message: "Failed to Signup", title: "")
                print(error?.localizedDescription as Any)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
