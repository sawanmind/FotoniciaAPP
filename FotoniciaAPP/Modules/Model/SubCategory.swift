//
//  SubCategory.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 02/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class SubCategory: NSObject {
    var id:String!
    var name:String!
    var imageURL:String?
    init(id: String, name: String, imageURL: String) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
    }
    init?(serverData:[String : Any]) {
        guard let id = serverData["entity_id"] as? String else {
            print("Error: SubCategory Id not found")
            return nil
        }
        self.id = id
        self.name = serverData["name"] as? String ?? ""
        self.imageURL = serverData["image_url"] as? String
    }
    
    init?(serverTrendingItems:[String : Any]) {
        guard let id = serverTrendingItems["item_id"] as? String else {
            print("Error: SubCategory Id not found")
            return nil
        }
        self.id = id
        self.name = serverTrendingItems["name"] as? String ?? ""
        self.imageURL = serverTrendingItems["item_image"] as? String
    }
    
    init?(serverFormData:[String : Any]) {
        guard let id = serverFormData["form_id"] as? String else {
            print("Error: SubCategory Id not found")
            return nil
        }
        self.id = id
        self.name = serverFormData["name"] as? String ?? ""
        self.imageURL = serverFormData["form_image"] as? String
    }
    
    init?(serverFillerData:[String : Any]) {
        guard let id = serverFillerData["filler_id"] as? String else {
            print("Error: SubCategory Id not found")
            return nil
        }
        self.id = id
        self.name = serverFillerData["name"] as? String ?? ""
        self.imageURL = serverFillerData["filler_image"] as? String
    }
    
    init?(serverSubCategoryDetialsData:[String : Any]) {
        guard let id = serverSubCategoryDetialsData["entity_id"] as? String else {
            print("Error: SubCategory Id not found")
            return nil
        }
        self.id = id
        self.name = serverSubCategoryDetialsData["name"] as? String ?? ""
        self.imageURL = serverSubCategoryDetialsData["image_url"] as? String
    }
    
    init?(serverCouponData:[String : Any]) {
        guard let id = serverCouponData["coupon_id"] as? String else {
            print("Error: SubCategory coupon_id not found")
            return nil
        }
        self.id = id
        self.name = serverCouponData["name"] as? String ?? ""
        self.imageURL = serverCouponData["coupon_image"] as? String
    }
    
}
