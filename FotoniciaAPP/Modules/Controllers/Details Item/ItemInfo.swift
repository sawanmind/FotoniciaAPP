//
//  ItemInfo.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 07/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit
extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
struct CreationDetail {
    var id:String = ""
    var printSize:String = ""
    var frameSize:String = ""
    var price: Double = 0.0
    
    var frameSizeAndPrice : String! {
        set {
            
        }
        get {
            return frameSize + " | INR " + "\(price)"
        }
    }
    
    init?(serverData:[String : Any]) {
        guard let id = serverData["item_id"] as? String else {
            print("Error: SubCategoryItems Id not found")
            return nil
        }
        self.id = id
        self.printSize = serverData["print_size"] as? String ?? ""
        self.frameSize = serverData["frame_sizes"] as? String ?? ""
        self.price = (Double((serverData["price"] as? String ?? "0.0"))?.roundTo(places: 2))!
    }
}

class ItemInfo: NSObject {
    var id:String!
    var name:String!
    var arrayImageURL = [String]()
    var itemRating:String = "0.0"
    var itemRatingReviewCount:String = "0"
    var creationTime:String = ""
    var videoId:String = ""
    var itemDescription: String!
    var itemShortDescription:String!
    var arrayCreationDetails = [CreationDetail]()
        
    init?(serverData:[String : Any]) {
        guard let id = serverData["video_id"] as? String else {
            print("Error: SubCategoryItems Id not found")
            return nil
        }
        self.id = id
        self.name = serverData["item_name"] as? String ?? ""
        self.itemRating = serverData["item_ratings"] as? String ?? String(serverData["item_ratings"] as? Float ?? 0.0)
        self.itemRatingReviewCount = serverData["item_review_count"] as? String ?? String(serverData["item_review_count"] as? Int ?? 0)
        self.creationTime = serverData["creation_time"] as? String ?? ""
        self.videoId = serverData["video_id"] as? String ?? ""
        self.itemDescription = serverData["item_description"] as? String ?? ""
        self.itemShortDescription = serverData["item_short_description"] as? String ?? ""
        
        
        if let arrayImage = serverData["item_images"] as? [[String : Any]] {
            for imageURL in arrayImage {
                if let url = imageURL["item_image"] as? String {
                    self.arrayImageURL.append(url)
                }
            }
        }
        
        if let arrayCreationDetails = serverData["creation_details"] as? [[String : Any]] {
            for creationDetails in arrayCreationDetails {
                if let creationDetail = CreationDetail(serverData: creationDetails) {
                    self.arrayCreationDetails.append(creationDetail)
                    self.arrayCreationDetails.append(creationDetail)
                    self.arrayCreationDetails.append(creationDetail)
                    self.arrayCreationDetails.append(creationDetail)
                    self.arrayCreationDetails.append(creationDetail)
                    self.arrayCreationDetails.append(creationDetail)
                }
            }
        }
    }
}
