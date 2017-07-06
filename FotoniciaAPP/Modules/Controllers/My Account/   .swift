//
//  MyAccountTableViewCell.swift
//  Photonicia
//
//  Created by Asheesh Verma on 27/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class MyAccountTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgViewDottted: UIImageView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var constraintHeightSeparatorView: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
