//
//  OrderTableViewCell.swift
//  FotoniciaAPP
//
//  Created by Rajni on 27/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell  {

    @IBOutlet weak var btncancale: UIButton!
    @IBOutlet weak var lblMassage: UILabel!
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var lblorderNo: UILabel!
    @IBOutlet weak var lblPints: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnActionReorder(_ sender: Any)
    {
    self.Reorder()
    }

    @IBAction func btnActionShare(_ sender: Any)
    {
        //self.shareOnSocialMedia()
    }
    @IBAction func btnActionCancel(_ sender: Any)
    {
        // create the alert
        let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        //self.present(alert, animated: true, completion: nil)

       self.Cancel()
       btncancale.isHidden = true

    }

        
    
    
    
    func Reorder() {
        
        let dicParams :[String:Any] = ["user_id" : "85","hash_key" : "","order_id": ""]
        
        //let dicParams:[String : Any] = ["user_details" : dicUserDetails, "device_info" : Device.deviceInfo(), "hash_key" : ""]
        print("Dic parameters: \(dicParams)")
        
        RequestManager().reOrder(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
//                let alert = UIAlertController(title: "", message: "ReOrder Order succesfully", preferredStyle: .alert)
//                let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
//                    if let response = responseModel as? [String : Any] {
//                        UserDefaults.saveUserInfo(userInfo: response)
//                    }
//                    
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
    
    
    func Cancel() {
        
        let dicParams :[String:Any] = ["user_id" : "85","hash_key" : "","order_id": ""]
        
        //let dicParams:[String : Any] = ["user_details" : dicUserDetails, "device_info" : Device.deviceInfo(), "hash_key" : ""]
        print("Dic parameters: \(dicParams)")
        
        RequestManager().cancelOrder(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
                    let alert = UIAlertController(title: "", message: "Cancel Order succesfully", preferredStyle: .alert)
                    let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                                    if let response = responseModel as? [String : Any] {
                                        UserDefaults.saveUserInfo(userInfo: response)
                                    }
                      UITableViewCell()
                                })
//                                alert.addAction(actionOK)
//                                self.present(alert, animated: true, completion: {
                                //})
                            }else{
//                                self.alert(message: "Failed to Signup", title: "")
//                                print(error?.localizedDescription as Any)
                            }
            }
        }
    
    
    
    
    }



//extension UIViewController
//{
//
//    class func alertReminden(timeInterval: Int)
//    {
//        var refreshAlert = UIAlertController(title: "Refresh", message: "All data will be lost.", preferredStyle: UIAlertControllerStyle.alert)
//        
//        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
//            Alarm.createReminder("Catch the Bus",
//                                 timeInterval: NSDate(timeIntervalSinceNow: Double(timeInterval * 60)))
//        }))
//        
//        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction!) in
//            println("Handle Cancel Logic here")
//        }))
//        
//        UIViewController.presentViewController(refreshAlert)
//        
//        
//    }
//}
