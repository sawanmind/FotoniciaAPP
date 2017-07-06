//
//  MyReviewTableViewCell.swift
//  FotoniciaAPP
//
//  Created by Rajni on 24/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class MyReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var lbldateandtime: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var ratenadreview: UIView!
    @IBOutlet weak var detials: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
