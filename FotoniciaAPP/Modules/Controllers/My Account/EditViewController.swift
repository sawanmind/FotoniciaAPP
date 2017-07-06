//
//  EditViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 29/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SUBMIT"
        navigationController?.navigationBar.tintColor = UIColor.black
        self.showLeftBarButtonItemWithImage()
        // Do any additional setup after loading the view.


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//
//    
//    func EditProfile() {
////        let dicUserDetails :[String:Any] = ["first_name" : self.textFieldFirstname.text!, "last_name" : self.textFieldLastName.text!, "phone" : self.textFieldMobileNumber.text!, "email" : self.textFieldEmail.text!,"password" : self.textFieldPassword.text!, "login_type" : "0", "social_id" : "", "gender" : "male","gender" : "female"]
////        
////        let dicParams:[String : Any] = ["user_details" : dicUserDetails, "device_info" : Device.deviceInfo(), "hash_key" : ""]
////        print("Dic parameters: \(dicParams)")
//        
//        RequestManager().register(parameters: dicParams, loader: true) { (status, responseModel, error) in
//            if status {
//                
//                let response = responseModel as! Dictionary<String,AnyObject>
//                if let objOTPViewController = self.storyboard?.instantiateViewController(withIdentifier: "OTPVerfyViewController") as? OTPVerfyViewController{
//                    
//                    //objOTPViewController.otp = response["otp"] as! String!
//                    //objOTPViewController.mobileNumber = textFieldMobileNumber
//                    
//                    self.navigationController?.pushViewController(objOTPViewController, animated: true)
//                    
//                    //                let alert = UIAlertController(title: "", message: "OTP Created", preferredStyle: .alert)
//                    //                let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
//                    //                    if let response = responseModel as? [String : Any] {
//                    //                        //UserDefaults.saveUserInfo(userInfo: response)
//                }
//                //                    //self.setRootMenuView()
//                //                })
//                //                alert.addAction(actionOK)
//                //                self.present(alert, animated: true, completion: {
//                //                })
//                //            }else{
//                //                self.alert(message: "Failed to Signup", title: "")
//                //                print(error?.localizedDescription as Any)
//                //            }
//            }
//        }
//    }
//
   
}
