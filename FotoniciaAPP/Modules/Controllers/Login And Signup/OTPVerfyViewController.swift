//
//  OTPVerfyViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 31/05/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class OTPVerfyViewController: UIViewController {
    
    

    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var btnResendOTP: UIButton!
    @IBOutlet weak var btnVerifyOTP: UIButton!
    
    var userInfo = [String : Any]()

    var otp:String?
    var mobileNumber:String?

    var otptext = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //txtField.text = otptext
        //UserDefaults.setUserID(userID: otptext)
        
        
    }
    
    
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


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnResendOTPAction(_ sender: Any)
    {
        self.ReSETOTP()
    }
    @IBAction func btnVerifyAction(_ sender: Any)
    {
        
        self.otp1()
//        if txtField.text! == otp!{
//            self.otp1()
//        }else{
//            print("invalid otp")
//        }
}


    
    func otp1() {
        //let ud = UserDefaults.standard
        var userId = ""
        if let id = userInfo["user_id"] as? String {
            userId = id
        }else if let id = userInfo["user_id"] as? Int {
            userId = String(id)
        }
        
        print("User ID: \(userId)")
        let dicParams:[String : Any] = ["user_id" :  userId, "otp" : self.txtField.text!]
        print("Dic parameters: \(dicParams)")
        
        RequestManager().sendOTP(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
                 self.setRootMenuView()
                UserDefaults.saveUserInfo(userInfo: self.userInfo)
                
               
            }
        }
        
        
    }
    
    //MAR Re-setotp
    
    func ReSETOTP() {
        //let ud = UserDefaults.standard
        var userId = ""
        if let id = userInfo["user_id"] as? String {
            userId = id
        }else if let id = userInfo["user_id"] as? Int {
            userId = String(id)
        }
        print("User ID: \(userId)")
        
        print(self.txtField.text)
        let dicParams:[String : Any] = ["user_id" :  userId, "request_type" : self.txtField.text!]
        print("Dic parameters: \(dicParams)")
        
//        let dicParams:[String : Any] = ["user_id" :  userId, "request_type" : "resendotp"]
//        print("Dic parameters: \(dicParams)")
        
        RequestManager().sendOTP(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
                
                
                UserDefaults.saveUserInfo(userInfo: self.userInfo)
                self.setRootMenuView()
                //                //UserDefaults.standard.set(true, forKey: "setRootMenuView")
                //                let alert = UIAlertController(title: "", message: "Signup succesfully", preferredStyle: .alert)
                //                let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                ////                    if let response = responseModel as? [String : Any] {
                ////                        UserDefaults.saveUserInfo(userInfo: response)
                ////                    }
                //                    self.setRootMenuView()
                //                })
                //                alert.addAction(actionOK)
                //                self.present(alert, animated: true, completion: {
                //                })
                //            }else{
                //                self.alert(message: "Failed to Signup", title: "")
                //                print(error?.localizedDescription as Any)
                //            }
            }
        }
    }
    
}
