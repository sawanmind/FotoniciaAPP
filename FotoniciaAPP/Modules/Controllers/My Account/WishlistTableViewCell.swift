//
//  WishlistTableViewCell.swift
//  FotoniciaAPP
//
//  Created by Rajni on 04/07/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

//class WishlistTableViewCell: UITableViewCell {
//
//    @IBOutlet var imageview: UIImageView!
//    
//       
//    
//    @IBOutlet weak var lblTitle: UILabel!
//    @IBOutlet weak var lblSubTitle: UILabel!
//    @IBOutlet weak var viewCenter: UIView!
//
//    
//    var subCategoryModel: wishlist? {
//        didSet {
//            if let subCategoryModel = self.subCategoryModel {
//                self.lblTitle.text = subCategoryModel.name.uppercased()
//                self.lblSubTitle.text = "Price starting at INR" + " " + subCategoryModel.startingPrice
//                self.imageview.sd_setImage(with: URL(string: subCategoryModel.imageURL), placeholderImage: UIImage(named:"subcat_item_image_placeholder"), options: .retryFailed, progress: { (i, j) in
//                    
//                }, completed: { (image, error, type, url) in
//                    if let image = image {
//                        self.imageView?.image = image
//                    }
//                })
//            }
//        }
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}
