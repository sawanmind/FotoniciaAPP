//
//  SubCategoryItems.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 07/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class SubCategoryItems: NSObject {
    var id:String!
    var name:String!
    var imageURL:String!
    var startingPrice:String = "0.0"

    init?(serverData:[String : Any]) {
        guard let id = serverData["item_id"] as? String else {
            print("Error: SubCategoryItems Id not found")
            return nil
        }
        self.id = id
        self.name = serverData["item_name"] as? String ?? ""
        self.startingPrice = serverData["item_starting_price"] as? String ?? ""
        self.imageURL = serverData["item_image"] as? String ?? ""
    }
}
