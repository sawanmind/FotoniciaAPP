//
//  ReviewAndRatingsViewController.swift
//  Photonicia
//
//  Created by Asheesh Verma on 21/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class RatingAndReviewModel: NSObject {
    var id:String!
    var reviewBy:String!
    var reviewRate:String = "0"
    var date:String?
    var reviewTitle:String?
    var reviewDescription:String?

    init?(serverData:[String : Any]) {
        guard let id = serverData["review_id"] as? String else {
            print("Error: RatingAndReviewModel Id not found")
            return nil
        }
        self.id = id
        self.reviewBy = serverData["review_by"] as? String ?? ""
        self.reviewRate = serverData["review_rate"] as? String ?? "0"
        self.date = serverData["review_date"] as? String ?? ""
        self.reviewTitle = serverData["review_header"] as? String ?? ""
        self.reviewDescription = serverData["review_description"] as? String ?? ""
        
    }
}


class ReviewAndRatingsViewController: UIViewController {

    @IBOutlet weak var tblViewReviewAndRatings: UITableView!
    var arrayData = [RatingAndReviewModel]()
    var itemId:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.showLeftBarButtonItemWithImage()

        // Configure countryTable
        self.tblViewReviewAndRatings.tableFooterView = UIView()
        
        self.tblViewReviewAndRatings.register(UINib(nibName: "UserReviewsAndRatingListTableViewCell", bundle: nil), forCellReuseIdentifier: "UserReviewsAndRatingListTableViewCell")
        
        self.tblViewReviewAndRatings.register(UINib(nibName: "ReviewAndRatingsOverallHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewAndRatingsOverallHeaderTableViewCell")
        
        self.tblViewReviewAndRatings.rowHeight = UITableViewAutomaticDimension
        self.tblViewReviewAndRatings.estimatedRowHeight = 94.0
        
        self.getReviewAndRating(itemId: self.itemId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    

    func getReviewAndRating(itemId:String) {
        let dicParams : [String : Any] = ["item_id" : itemId, "user_id" : ""]
        
        RequestManager().getReviewAndRating(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
                print("Data: \(responseModel ?? [:])")
                
                if let arrayData = responseModel?["review_details"] as? [[String : Any]] {
                    for dicFormData in arrayData {
                        if let ratingAndReviewModel = RatingAndReviewModel(serverData: dicFormData) {
                            self.arrayData.append(ratingAndReviewModel)
                        }
                    }
                }
                self.tblViewReviewAndRatings.reloadData()
                
            }else {
                print("Error: \(error?.localizedDescription as Any)")
            }
        }
    }

}

extension ReviewAndRatingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserReviewsAndRatingListTableViewCell") as! UserReviewsAndRatingListTableViewCell
        cell.lblDate.text = self.arrayData[indexPath.row].date
        cell.lblTitle.text = self.arrayData[indexPath.row].reviewTitle?.capitalized
        cell.lblDescription.text = self.arrayData[indexPath.row].reviewDescription?.capitalized
        cell.lblUserName.text = "By" + " " + self.arrayData[indexPath.row].reviewBy.capitalized
        cell.ratingView.rating = Float(self.arrayData[indexPath.row].reviewRate)!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 295
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewAndRatingsOverallHeaderTableViewCell") as! ReviewAndRatingsOverallHeaderTableViewCell
        var rating1:Float = 0.0
        var rating2:Float = 0.0
        var rating3:Float = 0.0
        var rating4:Float = 0.0
        var rating5:Float = 0.0
        
        for data in arrayData {
            switch data.reviewRate {
            case "1":
                rating1 = rating1 + 1
            case "2":
                rating2 = rating2 + 2
            case "3":
                rating3 = rating3 + 3
            case "4":
                rating4 = rating4 + 4
            case "5":
                rating5 = rating5 + 5
                
            default:
                break
            }
        }
        if self.arrayData.count > 0 {
            rating1 = Float(rating1/Float(arrayData.count))
            rating2 = Float(rating2/Float(arrayData.count))
            rating3 = Float(rating3/Float(arrayData.count))
            rating4 = Float(rating4/Float(arrayData.count))
            rating5 = Float(rating5/Float(arrayData.count))
        }
        
        
        cell.viewRating1.rating = Float(rating1)
        cell.viewRating2.rating = Float(rating2)
        cell.viewRating3.rating = Float(rating3)
        cell.viewRating4.rating = Float(rating4)
        cell.viewRating5.rating = Float(rating5)
        
        return cell
    }
}
