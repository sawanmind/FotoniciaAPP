//
//  Constants.swift
//  FotoniciaAPP
//
//  Created by Rajni on 29/05/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import Foundation
import UIKit


func getHeaderParams()->[String:String]?{
    return ["Content-Type": "application/json",]
}


let sideMenuArray = [["title" :"Home", "image": ""], ["title" :"Offers", "image": ""], ["title" :"Compare Products", "image": ""], ["title" :"BookGas", "image": ""], ["title" :"About Us", "image": ""], ["title" :"Privacy", "image": ""]]

let kSideMenuCell = "SideMenuCell"

let kAPI = "index"
let API  = "page"
let kData = "data"
let kStatus = "status"


struct Constant {
    struct PlaceHolderImage {
        static let UserProfile = "DummyProfile"
        static let Background = "Cart"

    }
    struct AppThemeColors {
        static let NavigationBarColor:UIColor = UIColor(red: 212.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    }


    struct APIUrls {
        static let BaseURL = "http://www.zataksoftech.info/fotonicia/mobileapi/"
        
    }
    
    struct APIEndPoints {
        //static let AllRegionsAPIEndPoint = "/city"
        //static let AllSubRegionAPIEndPoint = "/location/"
        
        
        static let Login = "/getlogin"
        static let Register = "/getregistration"
        static let SendOTP = "/validateOtp"
        static let ForgetPassword = "/getForgotPassword"
        static let ChangePassword = "/changePassword"
        static let GetDashboard = "/getDashboard"
        static let GetSubCategory = "/getSubCategory"
        static let GetCategoryItem = "/getCategoryItem"
        static let GetItem = "/getItem"
        static let GetReviewDetails = "/getReviewDetails"
        static let SubmitReview = "/submitReview"
        
        static let Getwishlist = "/getWishlist"
        static let Removewishlist = "/removeItemFromWishlist"
        
        static let Addaddress = "/addAddress"
        static let Getaddress = "/getAddress"
        
        static let EditMyList = "/editUserProfile"
        static let GetOrder = "/getCustomerOrder"
        static let Reorder = "reorder"
        static let Cancelorder = "/cancelOrder"
        
        static let Getpage = "/getPage"
        
        static let Getreview = "/getReview"
        
       
        



    }
    
    struct StoryboardsName {
        static let HomeStoryboardName = "HomeView"
        static let SideMenuStoryboardName = "SideMenu"
        static let MainStoryboardName = "Main"
        static let AppWalkThroughStoryboardName = "Login&Signup"
        static let RegionStoryboardName = "Region"
        
        static let LoginAndSignupStoryboardName = "LoginAndSignupView"
    }
    
    struct ViewControllerIdentifiers {
        static let HomeViewControllerIdentifier = "HomeViewController"
        static let SideMenuViewControllerIdentifier = "SideMenuViewController"
        static let AppWalkThroughNavigationControllerIdentifier = "LoginAndSignupNavigationController"
        static let RegionViewControllerIdentifier = "SelecetLocationVC"
        static let LoginAndSignupNavigationControllerIdentifier = "LoginAndSignupNavigationController"
    }
    
    struct AlertMessage {
        struct SigninAndSignup {
            static let EmptyField = "Field can not be empty"
            static let ValidLastName = "Please enter valid Last Name"
            static let ValidMobileNumber = "Please enter Valid mobile number"
            static let ValidEmail = "Please enter valid email"
            static let PasswordMismatch = "Password mismatch"
            static let PasswordLenghtLimit = "Password can not be less than 7 characters"
            
            static let Fullname = "Please Insert Full Name"
            static let addressFirst = "Please Insert Address"
            static let addressSecond = "Please Insert Second Address"
            static let PinCode = "Please Insert Pincode No"
            static let city = "Please Insert City"
            static let State = "Please Insert State"
            static let Country = "Please Insert Country"
            static let Saveas = "Please Insert Country"
       }
    }
    
    
    
}

