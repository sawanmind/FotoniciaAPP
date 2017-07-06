//
//  ServiceManager.swift
//  Gaso iOS
//
//  Created by Intelligrape on 15/10/16.
//  Copyright © 2016 G3nii. All rights reserved.
//

import UIKit

import Alamofire

class CustomLoader {
    static func showLoader() {
        var config : SwiftLoader.Config = SwiftLoader.Config()
        config.size = 170
        config.backgroundColor = UIColor.black
        config.spinnerColor = UIColor.white
        config.titleTextColor = UIColor.white
        config.spinnerLineWidth = 2.0
        config.foregroundColor = UIColor.black
        config.foregroundAlpha = 0.5
        
        
        SwiftLoader.setConfig(config: config)
        
        SwiftLoader.show(title: "Loading...", animated: true)
    }
    
    static func hideLoader() {
        SwiftLoader.hide()
    }
}
class ServiceManager: NSObject {
    
        
        /**
         Hit a POST request to app server.
         
         - parameter url:           server url to hit an Api.
         - parameter parameters:    Parameters to send as post request parameters.
         - parameter responseBlock: responseBlock to get status, jsonResponce or error
         */
        func postRequest(url : String, parameters : [String: Any], responseBlock:@escaping (_ status :Bool,  _ jsonResponse:Any?, _ error:Error?) -> Void ) {
            
            
            print("Url: \(url) &\nParameters: \(parameters)")
            CustomLoader.showLoader()
            Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
                
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value{
                        print("Response Data: \(data)")
                        responseBlock(true, data, nil)
                    }
                    CustomLoader.hideLoader()
                    break
                case .failure(_):
                    if let error = response.result.error {
                        print("Response Data: \(error)")
                        responseBlock(false, nil, response.result.error)
                    }
                    CustomLoader.hideLoader()
                    break
                    
                }
            }
    }

    
//            
//            Alamofire.request(.POST, url, parameters: parameters, encoding: .JSON, headers: getHeaderParams()).validate().responseJSON
//                { response in
//                    switch response.result {
//                    case .Success:
//                        print(response.result.value!)
//                        responseBlock(status: true, jsonResponse: response.result.value, error: nil)
//                    case .Failure:
//                        print(response.result.error!)
//                        responseBlock(status: false, jsonResponse: nil, error: response.result.error)
//                    }
//            }
//        }
    
    

//    Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: getHeaderParams()).responseJSON { (response:DataResponse<Any>) in
//    print(response.request as Any)  // original URL request
//    print(response.response as Any) // URL response
//    print(response.result.value as Any)   // result of response serialization
//    
//    switch response.result {
//    case .success(_):
//    DLog(logMessage: response.result.value! as AnyObject?)
//    responseBlock(true, response.result.value as AnyObject?, nil)
//    case .failure(_):
//    DLog(logMessage: response.result.error! as AnyObject?)
//    responseBlock(false, nil, response.result.error as NSError?)
//    }
//    }
//}

        /**
         Hit a GET request to app server.
 
         - parameter url:           server url to hit an Api.
         - parameter parameters:    Parameters to send as post request parameters.
         - parameter responseBlock: responseBlock to get status, jsonResponce or error
         */
//        func getRequest(url : String, parameters : [String: AnyObject], responseBlock:@escaping (_ status :Bool,  _ jsonResponse:AnyObject?, _ error:NSError?) -> Void ) {
//            Alamofire.request(.GET, url, parameters: parameters, encoding: .URLEncodedInURL , headers: getHeaderParams()).validate().responseJSON { response in
//                switch response.result {
//                case .Success:
//                    DLog(response.result.value!)
//                    responseBlock(status: true, jsonResponse: response.result.value, error: nil)
//                case .Failure:
//                    DLog(response.result.error!)
//                    responseBlock(status: false, jsonResponse: nil, error: response.result.error)
//                }
//            }
//        }
//        
//        
//        func getFlickrAPIRequest(url : String, parameters : [String: AnyObject], responseBlock:@escaping (_ status :Bool,  _ jsonResponse:AnyObject?, _ error:NSError?) -> Void ) {
//            Alamofire.request(.GET, url, parameters: parameters, encoding: .URLEncodedInURL , headers: nil).validate().responseJSON { response in
//                switch response.result {
//                case .Success:
//                    DLog(response.result.value!)
//                    responseBlock(status: true, jsonResponse: response.result.value, error: nil)
//                case .Failure:
//                    DLog(response.result.error!)
//                    responseBlock(status: false, jsonResponse: nil, error: response.result.error)
//                }
//            }
//        }
//        
//        
//        /**
//         Hit a DELETE request to app server.
//         
//         - parameter url:           server url to hit an Api.
//         - parameter parameters:    Parameters to send as post request parameters.
//         - parameter responseBlock: responseBlock to get status, jsonResponce or error
//         */
//        func deleteRequest(url : String, parameters : [String: AnyObject], responseBlock:@escaping (_ status :Bool,  _ jsonResponse:AnyObject?, _ error:NSError?) -> Void ) {
//            
//            Alamofire.request(.DELETE, url, parameters: parameters, encoding: .URLEncodedInURL, headers: getHeaderParams()).validate().responseJSON { response in
//                switch response.result {
//                case .Success:
//                    DLog(response.result.value!)
//                    responseBlock(status: true, jsonResponse: response.result.value, error: nil)
//                case .Failure:
//                    DLog(response.result.error!)
//                    responseBlock(status: false, jsonResponse: nil, error: response.result.error)
//                }
//            }
//        }
//        
//        /**
//         Hit a PATCH request to app server.
//         
//         - parameter url:           server url to hit an Api.
//         - parameter parameters:    Parameters to send as post request parameters.
//         - parameter responseBlock: responseBlock to get status, jsonResponce or error
//         */
//        func patchRequest(url : String, parameters : [String: AnyObject], responseBlock:@escaping (_ status :Bool,  _ jsonResponse:AnyObject?, _ error:NSError?) -> Void ) {
//            
//            Alamofire.request(.PATCH, url, parameters: parameters, encoding: .JSON, headers: getHeaderParams()).validate().responseJSON { response in
//                switch response.result {
//                case .Success:
//                    responseBlock(status: true, jsonResponse: response.result.value, error: nil)
//                case .Failure:
//                    responseBlock(status: false, jsonResponse: nil, error: response.result.error)
//                }
//            }
//        }
//        
//        /**
//         Hit a PUT request to app server.
//         
//         - parameter url:           Server url to hit an Api.
//         - parameter parameters:    Parameters to send as post request parameters.
//         - parameter responseBlock: ResponseBlock to get status, jsonResponce or error
//         */
//        func putRequest(url : String, parameters : [String: AnyObject],  responseBlock:@escaping (_ status :Bool,  _ jsonResponse:AnyObject?, _ error:NSError?) -> Void ) {
//            
//            Alamofire.request(.PUT, url, parameters: parameters, encoding: .JSON, headers: getHeaderParams()).validate().responseJSON { response in
//                switch response.result {
//                case .Success:
//                    responseBlock(status: true, jsonResponse: response.result.value, error: nil)
//                case .Failure:
//                    responseBlock(status: false, jsonResponse: nil, error: response.result.error)
//                }
//            }
//        }
//        
//        
//        /*!
//         Hit a multipart request to app server
//         
//         - parameter url:           Server url to hit an Api.
//         - parameter parameters:    Parameters to send as body in request.
//         - parameter imageOne:      First image to upload
//         - parameter imageTwo:      Second image to upload
//         - parameter responseBlock: ResponseBlock to get status, jsonResponce or error
//         */
//        func multipartTwoImageUploadRequest(url : String, parameters : [String: AnyObject],imageOneData : NSData!, imageTwoData : NSData!, responseBlock:@escaping (_ status :Bool,  _ jsonResponse:AnyObject?, _ error:NSError?) -> Void ){
//            
//            Alamofire.upload(.POST, url , headers:getHeaderParams() , multipartFormData: {
//                multipartFormData in
//                
//                multipartFormData.appendBodyPart(data: imageOneData, name: "imageOne", fileName: "imageOne.png", mimeType: "image/png")
//                multipartFormData.appendBodyPart(data: imageTwoData, name: "imageTwo", fileName: "imageTwo.png", mimeType: "image/png")
//                
//                for (key, value) in parameters {
//                    multipartFormData.appendBodyPart(data: value.dataUsingEncoding(NSUTF8StringEncoding)!, name: key)
//                }
//                
//            }, encodingCompletion: { encodingResult in
//                switch encodingResult {
//                case .Success(let upload, _, _):
//                    upload.validate().responseJSON {response in
//                        switch response.result {
//                        case .Success:
//                            responseBlock(status: true, jsonResponse: response.result.value, error: nil)
//                        case .Failure:
//                            responseBlock(status: false, jsonResponse: nil, error: response.result.error)
//                        }
//                    }
//                case .Failure(let encodingError):
//                    print(encodingError)
//                    responseBlock(status: false, jsonResponse: nil, error: nil)
//                }
//            })
//        }
//        
//        func multipartImageUploadRequest(url : String, parameters : [String: AnyObject],imageData : NSData!, responseBlock:@escaping (_ status :Bool,  _ jsonResponse:AnyObject?, _ error:NSError?) -> Void ){
//            
//            Alamofire.upload(.POST, url , headers:getHeaderParams() , multipartFormData: {
//                multipartFormData in
//                
//                if imageData.length > 0 {
//                    multipartFormData.appendBodyPart(data: imageData, name: "testimonialImageFile", fileName: parameters["imageName"] as! String, mimeType: parameters["mimeType"] as! String)
//                }
//                
//                for (key, value) in parameters {
//                    multipartFormData.appendBodyPart(data: value.dataUsingEncoding(NSUTF8StringEncoding)!, name: key)
//                }
//                
//            }, encodingCompletion: { encodingResult in
//                switch encodingResult {
//                case .Success(let upload, _, _):
//                    upload.validate().responseJSON {response in
//                        switch response.result {
//                        case .Success:
//                            responseBlock(status: true, jsonResponse: response.result.value, error: nil)
//                        case .Failure:
//                            responseBlock(status: false, jsonResponse: nil, error: response.result.error)
//                        }
//                    }
//                case .Failure(let encodingError):
//                    print(encodingError)
//                    responseBlock(status: false, jsonResponse: nil, error: nil)
//                }
//            })
//        }
    
     }
