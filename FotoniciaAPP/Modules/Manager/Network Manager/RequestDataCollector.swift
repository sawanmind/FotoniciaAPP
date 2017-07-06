//
//  RequestDataCollector.swift
//  FotoniciaAPP
//
//  Created by Rajni on 29/05/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import Foundation
class RequestDataCollector {
    class func getRegions()->[String:AnyObject]{
        let dic = [String:AnyObject]()
        return dic
    }
    
    class func getSubLocation(cityId:String!)->[String:AnyObject]{
        let dic = ["city_id":cityId]
        return dic as [String : AnyObject]
    }
    
    class func getHomeData2(locationID:String, latitude:Double, longitude:Double) -> [String:AnyObject] {
        
        let dic = ["location": locationID, "latitude": latitude, "longitude": longitude] as [String : Any]
        return dic as [String : AnyObject]
    }
    
    class func getOnlineOffer(categoryID:Int) -> [String:AnyObject] {
        
        let dic = ["category_id": categoryID]
        return dic as [String : AnyObject]
    }
    
    class func getRegisteratinDetails(mobile: String, deviceid: String,Gcmid: String, ddevicename: String, networkname: String, email: String, number: String) -> [String:AnyObject] {
        
        let dic = ["mobile" : mobile, "deviceid" : deviceid,"Gcmid" : Gcmid, "ddevicename" : ddevicename,"networkname" : networkname, "email" : email,"number" : number] as [String : Any]
        
        //        let dic = ["mobile" : mobile, "deviceid" : deviceid,"Gcmid" : Gcmid, "ddevicename" : ddevicename,"networkname" : networkname] as [String : Any]
        
        
        return dic as [String : AnyObject]
    }
}
