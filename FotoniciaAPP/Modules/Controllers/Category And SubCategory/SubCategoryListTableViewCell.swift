//
//  SubCategoryListTableViewCell.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 03/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class SubCategoryListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var viewCenter: UIView!
    var subCategoryModel: SubCategoryItems? {
        didSet {
            if let subCategoryModel = self.subCategoryModel {
                self.lblTitle.text = subCategoryModel.name.uppercased()
                self.lblSubTitle.text = "Price starting at INR" + " " + subCategoryModel.startingPrice
                self.imgView.sd_setImage(with: URL(string: subCategoryModel.imageURL), placeholderImage: UIImage(named:"subcat_item_image_placeholder"), options: .retryFailed, progress: { (i, j) in
                    
                }, completed: { (image, error, type, url) in
                    if let image = image {
                        self.imgView.image = image
                    }
                })
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
