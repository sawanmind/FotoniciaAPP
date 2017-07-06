//
//  CategoryListTableViewCell.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 03/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit
import SDWebImage

class CategoryListTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var constraintRightImgView: NSLayoutConstraint!
    @IBOutlet weak var constraintLeftImgView: NSLayoutConstraint!
    @IBOutlet weak var constraintRightLblTitle: NSLayoutConstraint!
    @IBOutlet weak var constraintLeftLblTitle: NSLayoutConstraint!
    var indexPath:IndexPath?
    
    var categoryModel: SubCategory? {
        didSet {
            if let categoryModel = self.categoryModel, let url = categoryModel.imageURL, categoryModel.imageURL!.characters.count > 0 {
                
                self.lblTitle.text = categoryModel.name
                if let indexPath = self.indexPath {
                    if indexPath.row % 2 == 0 {
                        self.constraintLeftImgView.constant = self.bounds.width - 25 - 90
                        self.constraintRightImgView.constant = self.bounds.width - 25 - 13
                        
                        self.constraintLeftLblTitle.constant = self.bounds.width - 25 - 13
                        self.constraintRightLblTitle.constant = self.bounds.width - 25 - 90
                        
                    }else {
                        self.constraintRightImgView.constant = self.bounds.width - 25 - 90
                        self.constraintLeftImgView.constant = self.bounds.width - 25 - 13
                        
                        self.constraintRightLblTitle.constant = self.bounds.width - 25 - 13
                        self.constraintLeftLblTitle.constant = self.bounds.width - 25 - 90
                    }
                }
                self.imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named:"sub_category_placeholder"), options: .retryFailed, progress: { (i, j) in
                    
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
