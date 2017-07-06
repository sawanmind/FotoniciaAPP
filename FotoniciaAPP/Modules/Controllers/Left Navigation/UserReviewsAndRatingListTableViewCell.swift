//
//  UserReviewsAndRatingListTableViewCell.swift
//  Photonicia
//
//  Created by Asheesh Verma on 21/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class UserReviewsAndRatingListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
