//
//  CategoryCollectionVerticalTableViewCell.swift
//  Photonicia
//
//  Created by Asheesh Verma on 20/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class CategoryCollectionVerticalTableViewCell: UITableViewCell {
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTtitle: UILabel!

    @IBOutlet weak var btnViewAll: UIButton!
    weak var delegate: ButtonActionProtocol?
    
    var indexPath:IndexPath?
    var categoryModel: Category? {
        didSet {
            print("Category Model")
            self.lblTtitle.text = categoryModel?.name
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.btnViewAll.layer.cornerRadius = 4
        self.btnViewAll.layer.masksToBounds = true
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        let height:CGFloat = 204.0
        var width = UIScreen.main.bounds.size.width
        width = (width - 26) / 2
        layout.itemSize = CGSize(width: width, height: height)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        collectionView.setCollectionViewLayout(layout, animated: true)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "CategoryVerticalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryVerticalCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnViewAllAction(_ sender: UIButton) {
        if let del = self.delegate {
            del.didSelectCollectionView(indexPath: self.indexPath!, collectionIndexPath: nil)
        }
    }
    
    
}


extension CategoryCollectionVerticalTableViewCell:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("index: \(indexPath.row)")
        
        let storyboard = UIStoryboard(name: "CategorySubCategoryStoryboard", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "SubCategoryViewController") as! SubCategoryViewController
        mainViewController.subCategory = self.categoryModel?.arraySubCategory[indexPath.row]
        if let topVC = UIApplication.topViewController() {
            if let topNavigationVC = topVC.navigationController {
                topNavigationVC.pushViewController(mainViewController, animated: true)
            }
        }
    }
    
}

extension CategoryCollectionVerticalTableViewCell:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let category = self.categoryModel{
            return category.arraySubCategory.count
        }else {
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryVerticalCollectionViewCell", for: indexPath) as! CategoryVerticalCollectionViewCell
        cell.backgroundColor = UIColor.randomColor
        cell.subCategory = self.categoryModel?.arraySubCategory[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height:CGFloat = 204.0
        var width = UIScreen.main.bounds.size.width
        width = (width - 26) / 2
        return CGSize(width: width, height: height)//CGSizeMake(CGFloat(width), CGFloat(height))
    }
    
}
