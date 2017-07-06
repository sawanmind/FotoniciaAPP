//
//  FoundationExtension.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 11/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import Foundation

// Definition:
extension Notification.Name {
    static let NotificationSideMenuHome = Notification.Name("NotificationSideMenuHome")
}

extension String {
    func floatSafeValue() -> Float {
        if let safeFloatValue = Float(self) {
            return safeFloatValue
        } else {
            return 0.0
        }
    }
    
    func intSafeValue() -> Int {
        if let safeIntValue = Int(self) {
            return safeIntValue
        } else {
            return 0
        }
    }
}

extension UserDefaults {
    
    //******************************************************************************************//
    //**************************************** SET *********************************************//
    //******************************************************************************************//
    
    static func saveUserInfo(userInfo: [String : Any]) {
    
        if let name = userInfo["name"] as? String {
            self.setUserName(userName: name)
        }
        if let userId = userInfo["user_id"] as? String {
            self.setUserID(userID: userId)
        }else if let userId = userInfo["user_id"] as? Int {
            self.setUserID(userID: String(userId))
        }
        if let userotp = userInfo["otp"] as? String {
            self.setUserotp(userotp: userotp)
        }else if let userotp = userInfo["otp"] as? Int {
            self.setUserotp(userotp: String(userotp))
        }

        if let email = userInfo["email_id"] as? String {
            self.setUserEmail(userEmail: email)
        }
        
        self.setUserLoginStatus(logingStatus: true)
    }
    
    static func setUserName(userName name: String) {
        UserDefaults.standard.set(name, forKey: "UserName")
        UserDefaults.standard.synchronize()
    }
    
    static func setUserID(userID id: String) {
        UserDefaults.standard.set(id, forKey: "UserId")
        UserDefaults.standard.synchronize()
    }
    
    static func setUserotp(userotp id: String) {
        UserDefaults.standard.set(id, forKey: "Userotp")
        UserDefaults.standard.synchronize()
    }
    static func setUserEmail(userEmail email: String) {
        UserDefaults.standard.set(email, forKey: "UserEmail")
        UserDefaults.standard.synchronize()
    }
    
    static func setUserLoginStatus(logingStatus status: Bool) {
        UserDefaults.standard.set(status, forKey: "UserLoginStatus")
        UserDefaults.standard.synchronize()
    }
    
    //******************************************************************************************//
    //**************************************** GET *********************************************//
    //******************************************************************************************//
    
    static func getUserName() -> String {
        return UserDefaults.standard.value(forKey: "UserName") as! String
    }
    
    static func getUserID() -> String {
        return UserDefaults.standard.value(forKey: "UserID") as! String
    }
    
//    static func getUserOTID() -> Int {
//        return UserDefaults.standard.value(forKey: "UserID") as! Int
//    }
    
    static func getUserEmail() -> String {
        return UserDefaults.standard.value(forKey: "UserEmail") as! String
    }
    
    static func getUserLoginStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: "UserLoginStatus")
    }
    static func getUserotp() -> String {
        return UserDefaults.standard.value(forKey: "Userotp") as! String
    }

    
    
    //******************************************************************************************//
    //**************************************** REMOVE *********************************************//
    //******************************************************************************************//
    
    static func removeUserInfo() {
        self.removeUserID()
        self.removeUserName()
        self.removeUserEmail()
        self.removeUserLoginStatus()
    }
    
    static func removeUserName() {
        UserDefaults.standard.removeObject(forKey: "UserName")
        UserDefaults.standard.synchronize()
    }
    
    static func removeUserID() {
        UserDefaults.standard.removeObject(forKey: "UserID")
        UserDefaults.standard.synchronize()
    }
    
    static func removeUserEmail() {
        UserDefaults.standard.removeObject(forKey: "UserEmail")
        UserDefaults.standard.synchronize()
    }
    
    static func removeUserLoginStatus() {
        UserDefaults.standard.removeObject(forKey: "UserLoginStatus")
    }
    
}
