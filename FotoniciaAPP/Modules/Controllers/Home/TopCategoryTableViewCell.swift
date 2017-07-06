//
//  TopCategoryTableViewCell.swift
//  Photonicia
//
//  Created by Asheesh Verma on 24/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit
enum TopCategoryTableViewCellType:String {
    case TopCategory
    case FormData
    case Coupon
    init() {
        self = .TopCategory
    }
}
class TopCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var separator: UILabel!
    var height:CGFloat = 90.0
    var width:CGFloat = UIScreen.main.bounds.size.width - 100
    var arraySubCategory = [SubCategory]()
    var indexPath:IndexPath?
    weak var delegate: ButtonActionProtocol?
    var cellType = TopCategoryTableViewCellType() {
        didSet {
            let PlaceHolderImage:UIImage?
            switch cellType {
            case .TopCategory:
                PlaceHolderImage = #imageLiteral(resourceName: "form_image_placeholder")
                self.backgroundColor = UIColor(red: 244/255, green: 102/255, blue: 165/255, alpha: 1)
                self.width = CGFloat(80)
                break
            case .FormData:
                self.backgroundColor = UIColor.white
                PlaceHolderImage = #imageLiteral(resourceName: "form_image_placeholder")
                self.height = CGFloat(90.0)
                break
            case .Coupon:
                self.backgroundColor = UIColor.white
                PlaceHolderImage = #imageLiteral(resourceName: "coupon_image_placeholder")
                self.height = CGFloat(200)
                break
            }
            self.collectionView.reloadData()
        }
    }
    
//    var arraySubCategory:SubCategory? {
//        didSet {
//            self.collectionView.reloadData()
//        }
//    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //.horizontal
        
        layout.itemSize = CGSize(width: self.width, height: self.height)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 0.0
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "CategoryHorizontalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryHorizontalCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TopCategoryTableViewCell:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("index: \(indexPath.row)")
        switch cellType {
        case .TopCategory:
            if let del = self.delegate {
                del.didSelectCollectionView(indexPath: self.indexPath!, collectionIndexPath: indexPath)
            }
        case .FormData:
            if let del = self.delegate {
                del.didSelectCollectionView(indexPath: self.indexPath!, collectionIndexPath: indexPath)
            }
        case .Coupon:
            if let del = self.delegate {
                del.didSelectCollectionView(indexPath: self.indexPath!, collectionIndexPath: indexPath)
            }
        }
    }
    
}

extension TopCategoryTableViewCell:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arraySubCategory.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryHorizontalCollectionViewCell", for: indexPath) as! CategoryHorizontalCollectionViewCell
        
        cell.backgroundColor = UIColor.white
        cell.subCategory = self.arraySubCategory[indexPath.row]
        
        switch cellType {
        case .TopCategory:
            
            cell.imgView.isHidden = true
            cell.lblTitle.isHidden = false
            break
        case .FormData:
            fallthrough
        case .Coupon:
            cell.imgView.isHidden = false
            cell.lblTitle.isHidden = true
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.width, height: self.height)
    }
    
}
