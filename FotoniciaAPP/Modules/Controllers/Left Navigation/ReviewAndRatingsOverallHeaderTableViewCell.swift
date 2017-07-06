//
//  ReviewAndRatingsOverallHeaderTableViewCell.swift
//  Photonicia
//
//  Created by Asheesh Verma on 23/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class ReviewAndRatingsOverallHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var viewRating1: RatingView!
    @IBOutlet weak var viewRating2: RatingView!
    @IBOutlet weak var viewRating3: RatingView!
    @IBOutlet weak var viewRating4: RatingView!
    @IBOutlet weak var viewRating5: RatingView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
