//
//  RequestManager.swift
//  FotoniciaAPP
//
//  Created by Rajni on 29/05/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import Foundation
//import PKHUD

class RequestManager {
//    func getAllRegions(parameters : [String: AnyObject],loader:Bool,responseBlock:(status :Bool,  responseModel:AnyObject?, error:NSError?) -> Void ){
//        let urlString = Constants.APIUrls.BaseURL + kAPI + Constants.APIEndPoints.AllRegionsAPIEndPoint
//        showLoader(loader)
//        
//        ServiceManager().getRequest(urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
//            self.hideLoader()
//            if (jsonResponse != nil) {
//                var regionsArray = Array<RegionsModel>()
//                let dicResponse = jsonResponse as! Dictionary<String,AnyObject>
//                let tempRegionsArray = dicResponse[kData] as! [AnyObject]
//                
//                for index in 0..<tempRegionsArray.count {
//                    let regionsModel = ResponseDataHandler.getRegionsModelFromResponse(tempRegionsArray[index] as! Dictionary<String,AnyObject>)
//                    regionsArray.append(regionsModel)
//                }
//                
//                responseBlock(status: true, responseModel:regionsArray, error:nil)
//            }
//            else {
//                print("Error: \(error)")
//            }
//        }
//    }
    
//    func getAllSubRegions(parameters : [String: AnyObject],loader:Bool,responseBlock:(status :Bool,  responseModel:AnyObject?, error:NSError?) -> Void ){
//        
//        let cityID = parameters["city_id"] as? String
//        let urlString = Constants.APIUrls.BaseURL + kAPI + Constants.APIEndPoints.AllSubRegionAPIEndPoint + cityID!
//        showLoader(loader)
//        
//        ServiceManager().getRequest(urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
//            self.hideLoader()
//            if (jsonResponse != nil) {
//                var regionsArray = Array<SubLocationModel>()
//                let dicResponse = jsonResponse as! Dictionary<String,AnyObject>
//                
//                if let _ = dicResponse[kStatus] as? String where (dicResponse[kStatus] as? String) == "1"{
//                    let tempRegionsArray = dicResponse[kData] as! [AnyObject]
//                    for index in 0..<tempRegionsArray.count {
//                        let regionsModel = ResponseDataHandler.getSubRegionsModelFromResponse(tempRegionsArray[index] as! Dictionary<String,AnyObject>)
//                        regionsArray.append(regionsModel)
//                    }
//                    
//                    responseBlock(status: true, responseModel:regionsArray, error:nil)
//                }else{
//                    print("Error \(dicResponse["message"])")
//                }
//                
//            }
//            else {
//            }
//        }
//    }
    
    func register(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.Register
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
    }
    
    
    func login(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.Login
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
    }
    
    func forgetPassword(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.ForgetPassword
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
    }
    
    
    
    func getPage(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + API + Constant.APIEndPoints.Getpage
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else{
                responseBlock(false, nil, error)
                
            }
        }
    }

    
   func changePassword(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.ChangePassword
        showLoader(show: loader)
    
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
        self.hideLoader()
        if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
             responseBlock(true, dicResponse, nil)
        }else{
           responseBlock(false, nil, error)
       
       }
      }
    }

    func addAddress(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.Addaddress
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else{
                responseBlock(false, nil, error)
                
            }
        }
    }

    func getAddress(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.Getaddress
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else{
                responseBlock(false, nil, error)
                
            }
        }
    }
    
    //MARK:My Edit Profile
    
    func EdidProfile(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.EditMyList
    showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
    }


    
    
    //MARK:My Order History
    
    
    func getCustomerOrder(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.GetOrder
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else{
                responseBlock(false, nil, error)
                
            }
        }
    }

    func reOrder(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.Reorder
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            
            if let dicResponse = jsonResponse as? [String: Any] {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
 
    }

    func cancelOrder (parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.Cancelorder
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else{
                responseBlock(false, nil, error)
                
            }
        }
    }
    
    //MARK: Wishlist
 
    func getWishlist (parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:[String: Any]?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.Getwishlist
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
    }

    
    func removeItemFromWishlist (parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:[String: Any]?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.Removewishlist
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
    }
    

    
    
    
    //MARK: MyReview
    func getReview (parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.Getreview
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else{
                responseBlock(false, nil, error)
                
            }
        }
    }

    
    
    
    
    func sendOTP(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.SendOTP
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
        
    }
    


//    
//    func sendOTP(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:Any?, _ error:Error?) -> Void ){
//        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.SendOTP + "?" + "mobileno=\(parameters["mobileno"] as! String)"
//        showLoader(show: loader)
//        
//        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
//            self.hideLoader()
//            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status"] as? String, status == "200" {
//                responseBlock(true, dicResponse, nil)
//            }else {
//                responseBlock(false, nil, error)
//            }
//        }
//        
//    }
    
    func getDashboard(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:[String: Any]?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.GetDashboard
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
    }
    
    func getSubCategory(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:[String: Any]?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.GetSubCategory
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
    }
    
    func getGetSubCategoryItems(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:[String: Any]?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.GetCategoryItem
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
    }
    
    
    func getItem(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:[String: Any]?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.GetItem
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            
            if let dicResponse = jsonResponse as? [String: Any], let status = dicResponse["status_code"] as? String, status == "200" {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
    }
    
    
    func getReviewAndRating(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:[String: Any]?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.GetReviewDetails
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            
            if let dicResponse = jsonResponse as? [String: Any] {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
    }
    
    func submitReviewAndRating(parameters : [String: Any],loader:Bool,responseBlock:@escaping (_ status :Bool,  _ responseModel:[String: Any]?, _ error:Error?) -> Void ){
        let urlString = Constant.APIUrls.BaseURL + kAPI + Constant.APIEndPoints.SubmitReview
        showLoader(show: loader)
        
        ServiceManager().postRequest(url: urlString, parameters: parameters) { (status, jsonResponse, error) -> Void in
            self.hideLoader()
            
            if let dicResponse = jsonResponse as? [String: Any] {
                responseBlock(true, dicResponse, nil)
            }else {
                responseBlock(false, nil, error)
            }
        }
    }
    
    
    //MARK:
    //MARK: Loader methods
    private func showLoader(show:Bool){
        if show {
            //HUD.dimsBackground = true
            //HUD.show(.Progress)
        }
    }
    
    private func flashSuccessLoader(delay: Double){
       // HUD.flash(.Success, delay: delay)
    }
    
    private func flashErrorLoader(delay: Double){
        //HUD.flash(.Error, delay: delay)
    }
    
    private func hideLoader(){
       // HUD.hide(animated: true, completion: nil)
    }
}
