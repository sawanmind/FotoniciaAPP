//
//  CategoryVerticalCollectionViewCell.swift
//  Photonicia
//
//  Created by Asheesh Verma on 20/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class CategoryVerticalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    var indexPath:IndexPath?
    weak var delegate: ButtonActionProtocol?
    var subCategory:SubCategory? {
        didSet {
            if let subCategory = self.subCategory, let url = subCategory.imageURL, subCategory.imageURL!.characters.count > 0 {
                
                self.lblTitle.text = subCategory.name
                
                self.imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named:"vertical_subcategory_image_placeholder"), options: .retryFailed, progress: { (i, j) in
                    
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

}
