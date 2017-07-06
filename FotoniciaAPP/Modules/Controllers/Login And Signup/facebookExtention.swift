//
//  facebookExtention.swift
//  FotoniciaAPP
//
//  Created by Rajni on 12/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

extension UIViewController
{
    func facebookLogin()
    {
        // To Check Internet Connectivity , If Internet is not available than shows Alert
        // Check Username & Password if not correct then give Login Failed Error
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.loginBehavior = FBSDKLoginBehavior.web
        fbLoginManager.logIn(withReadPermissions: [facebookResponseConstants.public_profile,facebookResponseConstants.email], from: self) { (result, error) -> Void  in
            if error != nil
            {
                // If Login Fails than This Alert Will be Show Message with Localized Description
                //hideLoader()
                debugPrint(error?.localizedDescription as Any)
            }
            else if (result?.isCancelled)!
            {
                // If Cancel Button Pressed than HideLoader & Dismiss that View & Login View will Appeared
                //hideLoader()
                self.dismiss(animated: true, completion: nil)
            }
            else
            {
                // Fetch  Facebook User Details
                FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name,last_name,email"]).start(completionHandler:
                    {
                        (connection, result, error) -> Void in
                        let fbDetails = result as? NSDictionary
                        debugPrint(fbDetails!)
                        
                        
                        if (error == nil)
                        {
                            
                        }
                })
            }
        }
    }
    
    /**
     * MARK: struct "facebookDataConstants" is used to get response data from fetched facebook Profile
     */
    struct facebookResponseConstants
    {
        static let email : String! = "email"
        static let name : String! = "name"
        static let id : String! = "id"
        static let first_name : String! = "first_name"
        static let last_name : String! = "last_name"
        static let type : String! = ".facebook"
        static let public_profile : String! = "public_profile"
    }
}
