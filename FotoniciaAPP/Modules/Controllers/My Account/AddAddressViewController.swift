//
//  AddAddressViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 22/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class AddAddressViewController: UIViewController ,UITextFieldDelegate{

   
    @IBOutlet weak var txtFullname: UITextField!
    @IBOutlet weak var txtaddress: UITextField!
    @IBOutlet weak var txtaddress2: UITextField!
    @IBOutlet weak var txtPincode: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
   @IBOutlet weak var txtMobNo: UITextField!
    @IBOutlet weak var txtSaveAs: UITextField!
    @IBOutlet weak var btnSwitchOn: UISwitch!
    
    @IBOutlet weak var btnSwitchOff: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ADD ADDRESS"
        navigationController?.navigationBar.tintColor = UIColor.black
        self.showLeftBarButtonItemWithImage()
        navigationController?.navigationBar.barTintColor = UIColor.cyan
        
        self.showLeftBarButtonItemWithImage()
        


        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.txtSaveAs.endEditing(true);
        return false;
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        txtSaveAs.resignFirstResponder()
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
    
    @IBAction func btnActionSubmit(_ sender: Any)
    {
        
        
        if self.txtFullname.text?.characters.count == 0{
            self.alert(message: Constant.AlertMessage.SigninAndSignup.Fullname, title: "")
            
        }
        else if self.txtaddress.text?.characters.count == 0 {
            self.alert(message: Constant.AlertMessage.SigninAndSignup.addressFirst, title: "")
        }
        else if self.txtaddress2.text?.characters.count == 0 {
            self.alert(message: Constant.AlertMessage.SigninAndSignup.addressSecond, title: "")
        }
        else if !self.txtPincode.text!.isValidPincode(value: self.txtPincode.text!){
            self.alert(message: Constant.AlertMessage.SigninAndSignup.PinCode, title: "")
        }
        else if txtCity.text == ""
        {
            self.alert(message: Constant.AlertMessage.SigninAndSignup.city, title: "")
        }
        else if txtState.text == ""
        {
            self.alert(message: Constant.AlertMessage.SigninAndSignup.State, title: "")
        }
        else if txtCountry.text == ""
        {
            self.alert(message: Constant.AlertMessage.SigninAndSignup.Country, title: "")
        }

        else if !self.txtMobNo.text!.isValidMobileNumber(value: self.txtMobNo.text!)
        {
            self.alert(message: Constant.AlertMessage.SigninAndSignup.ValidMobileNumber, title: "")
        }

        else if txtSaveAs.text == ""
        {
            self.alert(message: Constant.AlertMessage.SigninAndSignup.Saveas, title: "")
        }
        else{
            self.submit()
            
        }
    }

    
    func nextView()
    {
        let next = AddressViewController()
        
//        next.str = (self.arrMyData[indexPath.row] as? [String : String])?["image"] as NSString!
//        next.str1 = (self.arrMyData[(indexPath as NSIndexPath).row] as? [String : String])?["name"] as NSString!
//        next.str2 = (self.arrMyData[(indexPath as NSIndexPath).row] as? [String : String])?["offline"] as NSString!
//        

        
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    
    
    
    @IBAction func btnActionOn(_ sender: Any)
    {
        
    }

    func submit() {
        let dicParams :[String:Any] = ["user_id" : "85","firstname" : self.txtFullname.text!, "lastname" :  "", "city" : self.txtCity.text!, "region" : self.txtState.text!,"postcode" : self.txtPincode.text!, "telephone" : self.txtMobNo.text!, "street" : self.txtaddress.text!,"country_id" : "IN", "prefix" : self.txtSaveAs.text!]
        
        //let dicParams:[String : Any] = ["user_details" : dicUserDetails, "device_info" : Device.deviceInfo(), "hash_key" : ""]
        print("Dic parameters: \(dicParams)")
        
        RequestManager().addAddress(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
                let alert = UIAlertController(title: "", message: "Your Address succesfully", preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                    if let response = responseModel as? [String : Any] {
                        UserDefaults.saveUserInfo(userInfo: response)
                    }
                    self.nextView()
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
}



