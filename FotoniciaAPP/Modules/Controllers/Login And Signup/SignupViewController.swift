//
//  SignupViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 29/05/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit
struct Device {
    static func deviceInfo() -> [String : Any] {
    
        var dic = [String : Any]()
        let userDefault = UserDefaults.standard
        guard let dt =  userDefault.value(forKey: "DeviceToken") as? String else {
            dic = ["device_token" : "NotFound",
                   "device_osversion" : UIDevice.current.systemVersion,
                   "device_model" : UIDevice.current.model,
                   "device_name" : UIDevice.current.name,
                   "device_type" : "iPhone",
                   "app_version" : "1.0"]
            return dic
        }
        
        dic = ["device_token" : dt,
               "device_osversion" : UIDevice.current.systemVersion,
               "device_model" : UIDevice.current.model,
               "device_name" : UIDevice.current.name,
               "device_type" : "iPhone",
               "app_version" : "1.0"]
        
        return dic
    }
}
class SignupViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var textFieldFirstname: UITextField!
    
    @IBOutlet weak var textFieldLastName: UITextField!
    @IBOutlet weak var textFieldCode: UITextField!
    @IBOutlet weak var textFieldMobileNumber: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    
        //
    var gender : NSString = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        var responseModel: Any

        
               textFieldPassword.delegate=self
           }

    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textFieldPassword.endEditing(true);
        return false;
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textFieldPassword.resignFirstResponder()
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

    
    
    @IBAction func btnCloseAction(_ sender: Any)
    {
        self.dismiss(animated: true) {
            print("Controller dismissed")
        }

    }
    @IBAction func btnRegisterFacebookAction(_ sender: Any) {
    }
    @IBAction func btnRegisterGoogleAction(_ sender: Any) {
    }

    @IBAction func btnSignupAction(_ sender: Any)
    {
        if self.textFieldFirstname.text?.characters.count == 0{
            self.alert(message: Constant.AlertMessage.SigninAndSignup.EmptyField, title: "")
            
        }
        else if self.textFieldLastName.text?.characters.count == 0 {
            self.alert(message: Constant.AlertMessage.SigninAndSignup.ValidLastName, title: "")
        }
            
        else if !self.textFieldMobileNumber.text!.isValidMobileNumber(value: self.textFieldMobileNumber.text!)
                    {
                        self.alert(message: Constant.AlertMessage.SigninAndSignup.ValidMobileNumber, title: "")
                    }
            
        else if !self.textFieldEmail.text!.isValidEmail(testStr: self.textFieldEmail.text!){
            self.alert(message: Constant.AlertMessage.SigninAndSignup.ValidEmail, title: "")
        }
        else if !self.textFieldPassword.text!.isPasswordLenthCorrect(password: self.textFieldPassword.text!){
            self.alert(message: Constant.AlertMessage.SigninAndSignup.PasswordLenghtLimit, title: "")
         
//            else if !self.textFieldPassword.text!.isPasswordLenthCorrect(password: self.textFieldPassword.text!){
//                self.alert(message: Constants.AlertMessage.SigninAndSignup.PasswordLenghtLimit, title: "")
           // "Gender" : gender as String
        }
        else{
            self.signup()
            
        }
        
    }
    
    
    
//    class CheckBox: UIButton
//    {
//        // Images
//        let checkedImage = UIImage(named: radio_selected.yes)! as UIImage
//        let uncheckedImage = UIImage(named: radio_unselected.no)! as UIImage
//        
//        var completion : (() -> ())? = nil
//        
//        // Bool property to check image is selected or not
//        var isChecked: Bool = false
//        {
//            didSet
//            {
//                if isChecked == true
//                {
//                    self.setImage(checkedImage, for: .normal)
//                } else
//                {
//                    self.setImage(uncheckedImage, for: .normal)
//                }
//            }
//        }
//        
//        override func awakeFromNib()
//        {
//            self.addTarget(self, action: #selector(self.buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
//            self.isChecked = false
//        }
//        //MARK:
//        func buttonClicked(sender: UIButton)
//        {
//            if sender == self
//            {
//                isChecked = !isChecked
//            }
//            completion!()
//        }
//    }
    
    
    
    @IBAction func btnMaleAction(_ sender: Any)
   {
    
    
    
        if (btnMale.isSelected == true)
                {
                    btnMale.setBackgroundImage(UIImage(named: "radio_selected"), for: UIControlState.normal)
        
                    btnMale.isSelected = false;
                }
                else if(btnMale.isSelected == false)
                {
                    btnFemale.setBackgroundImage(UIImage(named: "radio_unselected"), for: UIControlState.normal)
        
                    btnMale.isSelected = true
                }

    }
    @IBAction func btnFemaleAction(_ sender: Any)
    {
        if (btnFemale.isSelected == true)
                {
                    btnFemale.setBackgroundImage(UIImage(named: "radio_selected"), for: UIControlState.normal)
        
                    btnFemale.isSelected = false;
                }
                else
                {
                    btnMale.setBackgroundImage(UIImage(named: "radio_unselected"), for: UIControlState.normal)
        
                    btnFemale.isSelected = true;
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
    
    
    
    //let response = responseModel as! Dictionary<String,AnyObject>
    //                if let objOTPViewController = self.storyboard?.instantiateViewController(withIdentifier: "OTPVerfyViewController") as? OTPVerfyViewController{
    
    //objOTPViewController.otp = response["otp"] as! String!
    //objOTPViewController.mobileNumber = textFieldMobileNumber
    
    //self.navigationController?.pushViewController(objOTPViewController, animated: true)
    
    
    
    
    //MARK: Server Communication
    
    
    func otp(userInfo:[String : Any])
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "verfy") as! OTPVerfyViewController
        
        viewController.userInfo = userInfo //self.response?["otp"] as! String!
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
    
    
    
    
    
    
    func signup() {
        let dicUserDetails :[String:Any] = ["first_name" : self.textFieldFirstname.text!, "last_name" : self.textFieldLastName.text!, "phone" : self.textFieldMobileNumber.text!, "email" : self.textFieldEmail.text!,"password" : self.textFieldPassword.text!, "login_type" : "0", "social_id" : "", "gender" : "male"]
        
        let dicParams:[String : Any] = ["user_details" : dicUserDetails, "device_info" : Device.deviceInfo(), "hash_key" : ""]
        print("Dic parameters: \(dicParams)")
        
        RequestManager().register(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
               
                if let response = responseModel as? [String : Any] {
                    self.otp(userInfo: response)
                }
                
                
//                if let objOTPViewController = self.storyboard?.instantiateViewController(withIdentifier: "Overfy") as? OTPVerfyViewController{
//                    
//                    objOTPViewController.otp = response?["otp"] as! String!
//                    //objOTPViewController.mobileNumber = phone
//                    
//                    self.navigationController?.pushViewController(objOTPViewController, animated: true)
//
                    }else{
                        print(error?.localizedDescription as Any)
            }
        }
        }

    }
    
    
    
    
//    func signup() {
//        let dicUserDetails :[String:Any] = ["first_name" : self.textFieldFirstname.text!, "last_name" : self.textFieldLastName.text!, "phone" : self.textFieldMobileNumber.text!, "email" : self.textFieldEmail.text!,"password" : self.textFieldPassword.text!, "login_type" : "0", "social_id" : "", "gender" : "male"]
//        
//        let dicParams:[String : Any] = ["user_details" : dicUserDetails, "device_info" : Device.deviceInfo(), "hash_key" : ""]
//        print("Dic parameters: \(dicParams)")
//        
//        RequestManager().register(parameters: dicParams, loader: true) { (status, responseModel, error) in
//            if status {
//                let alert = UIAlertController(title: "", message: "Partially Registered", preferredStyle: .alert)
//                let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
//                    if let response = responseModel as? [String : Any] {
//                        UserDefaults.saveUserInfo(userInfo: response)
//                    }
//                    self.otp()
//                })
//                alert.addAction(actionOK)
//                self.present(alert, animated: true, completion: {
//                })
//            }else{
//                self.alert(message: "Failed to Signup", title: "")
//                print(error?.localizedDescription as Any)
//            }
//        }
//    }
  

