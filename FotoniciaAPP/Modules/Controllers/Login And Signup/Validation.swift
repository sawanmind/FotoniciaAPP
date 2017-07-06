//
//  Validation.swift
//  FotoniciaAPP
//
//  Created by Rajni on 30/05/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import Foundation
extension String{
    
    
    // Last Name validation
    
    func isValidInput(testStr:String) -> Bool {
        let RegEx = "\\A\\w{7,18}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: testStr)
    }
    
    //Email Validation :
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    //Phone Number validation :
    
   
   
   
   static let strPhoneNumberRegex = "^((\\+)|(00)|(\\*)|())[0-9]{10,14}((\\#)|())$"
   
   
   func isValidMobileNumber(value : String) -> Bool
   {
      let phoneTest = NSPredicate(format:"SELF MATCHES %@", String.strPhoneNumberRegex)
      return phoneTest.evaluate(with: trim)
   }
   var trim: String
   {
      return self.trimmingCharacters(in: CharacterSet.whitespaces)
   }
   
//   
//   func validate(value: String) -> Bool {
//      
//      let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
//      
//      var phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
//      
//      var result =  phoneTest.evaluate(with: value)
//      
//      return result
//      
//   }
   //    func isValidPhoneNumber(value: String) -> Bool {
    //                let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
    //                let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    //                let result =  phoneTest.evaluate(with: value)
    //                return result
    //
    ////        let charcter  = NSCharacterSet(charactersInString: "+0123456789").invertedSet
    ////        var filtered:NSString!
    ////        let inputString:NSArray = self.componentsSeparatedByCharactersInSet(charcter)
    ////        filtered = inputString.componentsJoined(by: "") as NSString
    ////        return  self == filtered
    ////
    //    }
    
    //Pincode validation :
    func isValidPincode(value: String) -> Bool {
        if value.characters.count == 6{
            return true
        }
        else{
            return false
        }
    }
    
    //Password Validation : Check current and confirm is same.
    func isPasswordNotSame(password: String , confirmPassword : String) -> Bool {
        return password == confirmPassword
    }
    
    //Password length validation : length should grater than 7.
    func isPasswordLenthCorrect(password: String) -> Bool {
        if password.characters.count <= 6{
            return false
        }
        else{
            return true
        }
    }
}
