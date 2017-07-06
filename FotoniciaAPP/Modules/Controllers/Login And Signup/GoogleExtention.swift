//
//  GoogleExtention.swift
//  FotoniciaAPP
//
//  Created by Rajni on 13/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import Foundation
extension LoginViewController : GIDSignInUIDelegate, GIDSignInDelegate
{
    public func sign(_ signIn: GIDSignIn, didSignInFor user: GIDGoogleUser, withError error: Error?)
    {
        if error == nil
        {
            // Fetch  Google User Details
            //Store Data in socialUser Model
        }
        else
        {
            // Show Login Failed Error with localized Description
        }
    }
    
    
    // This Method will select Social Login Type
    func googleLogin()
    {
        GIDSignIn.sharedInstance().uiDelegate = self
        
        var configureError  : NSError?
        ///initialize google signin context
        ///Passed address of error over here
        GGLContext.sharedInstance().configureWithError(&configureError)
        
        if(configureError != nil)
        {
            return
        }
        assert(configureError == nil, "\(String(describing: configureError))")
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func googleLogout(){
        //Google logout functionality
        GIDSignIn.sharedInstance().signOut()
    }
}

// Gmail Constants
struct GoogleConstant
{
    static let clientID = "787736429158-9h2fsuen99qug9uaun7oocg7l0ipaotq.apps.googleusercontent.com"
    static let UrlScheme : String! = "com.googleusercontent.apps.787736429158-9h2fsuen99qug9uaun7oocg7l0ipaotq"
}
