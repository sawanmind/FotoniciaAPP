//
//  WriteReviewAndRatingsViewController.swift
//  Photonicia
//
//  Created by Asheesh Verma on 22/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class WriteReviewAndRatingsViewController: UIViewController {
    var itemId:String!

    @IBOutlet weak var viewRating: RatingView!
    @IBOutlet weak var txtFieldTitle: UITextField!
    @IBOutlet weak var txtViewDetails: PlaceHolderTextView!
    @IBOutlet weak var btnSubmit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.showLeftBarButtonItemWithImage()

        txtViewDetails.placeholder = "Enter your review"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        if self.txtFieldTitle.text!.isEmpty {
            
        }else if self.txtViewDetails.text.isEmpty {
            
        }else if self.viewRating.rating <= 0 {
            
        }else {
            self.submitReviewAndRating(itemId: self.itemId, customerId: "", title: self.txtFieldTitle.text!, details: self.txtViewDetails.text, ratingValue: Int(self.viewRating.rating))
        }
    }

    func submitReviewAndRating(itemId:String, customerId: String, title: String, details: String, ratingValue:Int) {
        let dicParams : [String : Any] = ["hash_key" : "", "item_id" : itemId, "customer_id" : customerId, "title" : title, "details" : details, "rating_value" : ratingValue]
        
        RequestManager().submitReviewAndRating(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
                print("Data: \(responseModel ?? [:])")
                
                if let arrayData = responseModel?["review_details"] as? [[String : Any]] {
                }
            }else {
                print("Error: \(error?.localizedDescription as Any)")
            }
        }
    }

}
