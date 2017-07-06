//
//  MyWishlistViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 23/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class MyWishlistViewController:  UIViewController
 {
    
    
    @IBOutlet var tableView: UITableView!
    
    
    var arrayData = [wishlist]()
    //var category:Category?
    var subCategory:WishList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                navigationItem.title = "MY WISHLIST"
                navigationController?.navigationBar.tintColor = UIColor.black
                self.showLeftBarButtonItemWithImage()
                //collectionView?.backgroundColor = UIColor.white
                self.showLeftBarButtonItemWithImage()
        
        //Register TableView
        
        self.tableView.register(UINib(nibName: "MyWishlistTableViewCell", bundle: nil), forCellReuseIdentifier: "MyWishlistTableViewCell")
        
        
            self.MyWishlist()

    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func MyWishlist() {
        
                    let dicParams : [String : Any] = ["hash_key" : "", "user_id" : "77"]
        
                    RequestManager().getWishlist(parameters: dicParams, loader: true) { (status, responseModel, error) in
                        if status {
                            print("Data: \(responseModel ?? [:])")
        
                            if let formData = responseModel?["item_details"] as? [[String : Any]] {
                                for dicFormData in formData {
                                    if let subCategory = wishlist(serverData: dicFormData) {
                                        self.arrayData.append(subCategory)
                                    }
                                }
                            }
                            self.tableView.reloadData()
        
                        }else {
                            print("Error: \(error?.localizedDescription as Any)")
                        }
                    }
                }
    
}
extension MyWishlistViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyWishlistTableViewCell", for: indexPath) as! MyWishlistTableViewCell
        cell.wishlist = arrayData[indexPath.row]
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100.0
//    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        let view = UIView()
//        view.backgroundColor = UIColor.randomColor
//        return view
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 267.0
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let storyboard = UIStoryboard(name: "DetailsItemStoryboard", bundle: nil)
//        let mainViewController = storyboard.instantiateViewController(withIdentifier: "DetailsItemHomeViewController") as! DetailsItemHomeViewController
//        //TODO: send selected id
//        mainViewController.itemId = self.arrayData[indexPath.row].id
//        self.navigationController?.pushViewController(mainViewController, animated: true)
//    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//
//    @IBOutlet weak var tableview: UITableView!
//   // @IBOutlet weak var CollectionView: UICollectionView!
//    
//    var arrayData = [wishlist]()
//    var category:Category?
//    var subCategory:SubCategory?
//
//    
//    //var image:[String] = ["item_image_placeholder.jpg","item_image_placeholder","item_image_placeholder.jpg","item_image_placeholder.jpg","item_image_placeholder.jpg"]
//    //@IBOutlet weak var tableview: UITableView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//       self.MyWishlist()
//        navigationItem.title = "MY WISHLIST"
//        navigationController?.navigationBar.tintColor = UIColor.black
//        self.showLeftBarButtonItemWithImage()
//        //collectionView?.backgroundColor = UIColor.white
////        collectionView?.register(Wishlist.self, forCellWithReuseIdentifier: "cellid")
////        
////        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
////        layout.sectionInset = UIEdgeInsets(top: 7, left: 7, bottom: 0, right: 7)
////        //layout.minimumInteritemSpacing = 12
////        layout.minimumLineSpacing = 10
////        
////        collectionView!.collectionViewLayout = layout
//        
//    }
//    
//    
//    
//    
//    
////    
//// func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
////    {
////        return image.count
////    }
//// func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
////    {
////        let cell:UICollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
////        let imgview:UIImageView = cell.viewWithTag(101) as! UIImageView
////        
////        imgview.image=UIImage(named: image[indexPath.row])
////        
////        return cell
////}
//    
//    
//    func MyWishlist() {
//        
//            let dicParams : [String : Any] = ["hash_key" : "", "user_id" : "77"]
//            
//            RequestManager().getWishlist(parameters: dicParams, loader: true) { (status, responseModel, error) in
//                if status {
//                    print("Data: \(responseModel ?? [:])")
//                    
//                    if let formData = responseModel["item_details"] as? [[String : Any]] {
//                        for dicFormData in formData {
//                            if let subCategory = wishlist(serverData: dicFormData) {
//                                self.arrayData.append(subCategory)
//                            }
//                        }
//                    }
//                    self.tableview.reloadData()
//                    
//                }else {
//                    print("Error: \(error?.localizedDescription as Any)")
//                }
//            }
//        }
//        
//    }
//
//extension MyWishlistViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.arrayData.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WishlistTableViewCell
//        cell.subCategoryModel = self.arrayData[indexPath.row]
//        return cell
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100.0
//    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        let view = UIView()
//        view.backgroundColor = UIColor.randomColor
//        return view
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 225.0
//    }
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        
////        let storyboard = UIStoryboard(name: "DetailsItemStoryboard", bundle: nil)
////        let mainViewController = storyboard.instantiateViewController(withIdentifier: "DetailsItemHomeViewController") as! DetailsItemHomeViewController
////        //TODO: send selected id
////        mainViewController.itemId = self.arrayData[indexPath.row].id
////        self.navigationController?.pushViewController(mainViewController, animated: true)
////}

}
        
        


