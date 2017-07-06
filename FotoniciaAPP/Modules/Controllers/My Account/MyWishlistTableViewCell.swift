//
//  MyWishlistTableViewCell.swift
//  FotoniciaAPP
//
//  Created by Rajni on 05/07/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class MyWishlistTableViewCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var ViewCenter: UIView!
    @IBOutlet weak var lblTitle: UILabel!
   
    @IBOutlet weak var lblSubTitle: UILabel!
    
    var wishlist: wishlist? {
        didSet {
            if let wishlist = self.wishlist {
                self.lblTitle.text = wishlist.name.uppercased()
                self.lblSubTitle.text = "Price starting at INR" + " " + wishlist.startingPrice
                self.imageview.sd_setImage(with: URL(string: wishlist.imageURL), placeholderImage: UIImage(named:"subcat_item_image_placeholder"), options: .retryFailed, progress: { (i, j) in
                    
                }, completed: { (image, error, type, url) in
                    if let image = image {
                        self.imageview.image = image
                    }
                })
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnRemoveWishListAction(_ sender: Any)
    {
        
        self.removeFromWishlist()
    }
    
    @IBAction func btnShareAction(_ sender: Any)
    {
        
    }
    
    
    
    
    func removeFromWishlist() {
        
        let dicParams : [String : Any] = ["wishlist_item_id:" : "12", "wishlist_id" : "5"]
        
        RequestManager().removeItemFromWishlist(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
            }
        }

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
