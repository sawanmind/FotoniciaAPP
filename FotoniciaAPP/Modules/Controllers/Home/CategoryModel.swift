//
//  CategoryModel.swift
//  Photonicia
//
//  Created by Asheesh Verma on 20/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class CategoryModel: NSObject {
    var id:String?
    var name:String?
    var arrayCategoryList = [Any]()
    init(id:String, name:String, arrayCategoryList:[Any]) {
        self.id = id
        self.name = name
        self.arrayCategoryList = arrayCategoryList
    }
}
