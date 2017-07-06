//
//  Category.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 02/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class Category: NSObject {
    var id:String!
    var name:String!
    var imageURL:String?
    var arraySubCategory = [SubCategory]()
    
    init?(serverData:[String : Any]) {
        guard let id = serverData["entity_id"] as? String else {
            return nil
        }
        self.id = id
        self.name = serverData["name"] as? String ?? ""
        self.imageURL = serverData["image_url"] as? String
        
        if let arraySubCategory = serverData["sub_category"] as? [[String : Any]] {
            for subCategory in arraySubCategory {
                if let subCategoryModel = SubCategory(serverData: subCategory) {
                    self.arraySubCategory.append(subCategoryModel)
                }
            }
        }
    }

}
