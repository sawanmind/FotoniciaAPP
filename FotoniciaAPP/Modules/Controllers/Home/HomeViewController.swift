//
//  HomeViewController.swift
//  Photonicia
//
//  Created by Asheesh Verma on 20/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableViewHome: UITableView!

    var arrayData = [Any]()
    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.

        NotificationCenter.default.addObserver(self, selector: #selector(self.sideMenuMethodNotificationReceived(notification:)), name: .NotificationSideMenuHome, object: nil)
        
        self.tableViewHome.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")

        self.refreshControl.addTarget(self, action: #selector(self.apiGetDashboard), for: .valueChanged)
        
        //Register TableView
        
        self.tableViewHome.register(UINib(nibName: "TopCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "TopCategoryTableViewCell")
        
        self.tableViewHome.register(UINib(nibName: "CategoryCollectionHorizontalTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryCollectionHorizontalTableViewCell")
        self.tableViewHome.register(UINib(nibName: "CategoryCollectionVerticalTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryCollectionVerticalTableViewCell")
        self.tableViewHome.register(UINib(nibName: "OfferHeaderPagingTableViewCell", bundle: nil), forCellReuseIdentifier: "OfferHeaderPagingTableViewCell")
        self.tableViewHome.register(UINib(nibName: "CategoryCollectionHorizontalTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryCollectionHorizontalTableViewCell")
        
        self.tableViewHome.estimatedRowHeight = UITableViewAutomaticDimension
        
        self.apiGetDashboard()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        // Stop listening notification
        NotificationCenter.default.removeObserver(self, name: .NotificationSideMenuHome, object: nil);

    }

    func sideMenuMethodNotificationReceived(notification: Notification) {
        if let row = notification.userInfo?["Row"] as? Int {
            if let menu = LeftMenu(rawValue: row) {
                self.changeViewController(menu)
            }
        }
    }
    
    @IBAction func btnCartAction(_ sender: UIBarButtonItem)
    {
        
    }
    

    
    func changeViewController(_ menu: LeftMenu) {
        let storyboard = UIStoryboard(name: "LeftNavigationStoryboard", bundle: nil)
        var vc: UIViewController?
        switch menu {
        case .aboutUs:
            vc = storyboard.instantiateViewController(withIdentifier: "AboutUsTableViewController") as! AboutUsTableViewController
        case .myAccount:
            let storyboardMyAccount = UIStoryboard(name: "MyAccountStoryboard", bundle: nil)
            
            vc = storyboardMyAccount.instantiateViewController(withIdentifier: "MyAccountTableViewController") as! MyAccountTableViewController
            break
        case .referAndEarn:
            vc = storyboard.instantiateViewController(withIdentifier: "ReferandEarnViewController") as! ReferandEarnViewController
            break
        case .offer:
            vc = storyboard.instantiateViewController(withIdentifier: "OffersTableViewController") as! OffersTableViewController
            break
        case .donateToEducate:
             vc = storyboard.instantiateViewController(withIdentifier: "DonateTableViewController") as! DonateTableViewController
            break
        case .helpAndFAQ:
            vc = storyboard.instantiateViewController(withIdentifier: "HelpandFaqViewController") as! HelpandFaqViewController
            break
        case .likeUs:
            vc = storyboard.instantiateViewController(withIdentifier: "LikeUsViewController") as! LikeUsViewController
            break
        case .FollowUs:
            vc = storyboard.instantiateViewController(withIdentifier: "FollowUsViewController") as! FollowUsViewController
            break
        case .rateUs:
            vc = storyboard.instantiateViewController(withIdentifier: "RateUsViewController") as! RateUsViewController

            break
        case .contactUs:
            vc = storyboard.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
            break
        case .feedback:
            vc = storyboard.instantiateViewController(withIdentifier: "FeedbackFormTableViewController") as! FeedbackFormTableViewController
            break
        case .photo:
            let storyboard = UIStoryboard(name: "DetailsItemStoryboard", bundle: nil)

            let vcPhoto:PhotoSelectionViewController? = storyboard.instantiateViewController(withIdentifier: "PhotoSelectionViewController") as? PhotoSelectionViewController
            if let viewController = vcPhoto {
                let nav = LeftNavigationViewController(rootViewController: viewController)
                self.present(nav, animated: true) {
                }
            }
            
            return
        }
        if let viewController = vc {
            let nav = LeftNavigationViewController(rootViewController: viewController)
            self.present(nav, animated: true) {
            }
        }
        
    }
    
    func apiGetDashboard() {
        let dicParams : [String : Any] = ["hash_key" : "", "user_id": ""]
        
        RequestManager().getDashboard(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
                print("Data: \(responseModel ?? [:])")
                
                var arrayForm = [SubCategory]()
                if let formData = responseModel?["array_forms"] as? [[String : Any]] {
                    for dicFormData in formData {
                        if let subCategory = SubCategory(serverFormData: dicFormData) {
                            arrayForm.append(subCategory)
                        }
                    }
                }
                
                var arrayFillers = [SubCategory]()
                if let formData = responseModel?["fillers"] as? [[String : Any]] {
                    for dicFormData in formData {
                        if let subCategory = SubCategory(serverFillerData: dicFormData) {
                            arrayFillers.append(subCategory)
                        }
                    }
                }
                
                var arrayCoupon = [SubCategory]()
                if let formData = responseModel?["array_coupons"] as? [[String : Any]] {
                    for dicFormData in formData {
                        if let subCategory = SubCategory(serverCouponData: dicFormData) {
                            arrayCoupon.append(subCategory)
                        }
                    }
                }
                
                var arrayTrendingItem = [SubCategory]()
                if let formData = responseModel?["array_trending_items"] as? [[String : Any]] {
                    for dicFormData in formData {
                        if let subCategory = SubCategory(serverTrendingItems: dicFormData) {
                            arrayTrendingItem.append(subCategory)
                        }
                    }
                }
                
                var arrayTopCategory = [SubCategory]()

                var arrayCategory = [Category]()
                if let formData = responseModel?["array_category"] as? [[String : Any]] {
                    for dicFormData in formData {
                        if let category = Category(serverData: dicFormData) {
                            arrayCategory.append(category)
                            if let img = category.imageURL  {
                                let subCategory = SubCategory(id: category.id, name: category.name, imageURL: img)
                                arrayTopCategory.append(subCategory)

                            }
                        }
                    }
                }
                self.arrayData.append(arrayTopCategory)
                self.arrayData.append(arrayForm)
                self.arrayData.append(arrayCoupon)
                self.arrayData.append(arrayTrendingItem)
                for category in arrayCategory {
                    self.arrayData.append(category)
                }
                self.refreshControl.endRefreshing()
                self.tableViewHome.reloadData()
                
            }else {
                print("Error: \(error?.localizedDescription as Any)")
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopCategoryTableViewCell", for: indexPath) as! TopCategoryTableViewCell
            cell.indexPath = indexPath
            cell.delegate = self
            cell.cellType = .TopCategory
            cell.arraySubCategory = self.arrayData[indexPath.row] as! [SubCategory]
            return cell
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopCategoryTableViewCell", for: indexPath) as! TopCategoryTableViewCell
            cell.indexPath = indexPath
            cell.delegate = self
            cell.cellType = .FormData
            cell.arraySubCategory = self.arrayData[indexPath.row] as! [SubCategory]
            return cell
        }else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopCategoryTableViewCell", for: indexPath) as! TopCategoryTableViewCell
            cell.indexPath = indexPath
            cell.delegate = self
            cell.cellType = .Coupon
            cell.arraySubCategory = self.arrayData[indexPath.row] as! [SubCategory]
            return cell
        }else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OfferHeaderPagingTableViewCell", for: indexPath) as! OfferHeaderPagingTableViewCell
            cell.indexPath = indexPath
            cell.delegate = self
            cell.arraySliderModel = self.arrayData[indexPath.row] as? [SubCategory]
            return cell
        }else {
            if indexPath.row % 2 != 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCollectionHorizontalTableViewCell", for: indexPath) as! CategoryCollectionHorizontalTableViewCell
                cell.indexPath = indexPath
                cell.delegate = self
                cell.viewBackground.backgroundColor = UIColor.randomColor
                cell.imgViewBottom.backgroundColor = UIColor.randomColor
                //cell.imgViewBottom.image = UIImage(named: "trending_items_bg.jpg")
                cell.categoryModel = self.arrayData[indexPath.row] as? Category
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCollectionVerticalTableViewCell", for: indexPath) as! CategoryCollectionVerticalTableViewCell
                cell.indexPath = indexPath
                cell.delegate = self
                cell.viewBackground.backgroundColor = UIColor.randomColor
                //cell.imageView?.image = UIImage(named: "trending_items_bg.jpg")
                
                //cell.backgroundView = UIImageView(image: UIImage(named: "trending_items_bg.jpg"))
                cell.categoryModel = self.arrayData[indexPath.row] as? Category
                return cell
            }
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 70.0
//    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
////        let view = UIView()
////        view.backgroundColor = UIColor.randomColor
////        return view
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TopCategoryTableViewCell", for: indexPath) as! TopCategoryTableViewCell
//        cell.indexPath = indexPath
//        cell.delegate = self
//        cell.cellType = .TopCategory
//        cell.arraySubCategory = self.arrayData[indexPath.row] as! [SubCategory]
//        return cell
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 90.0
        }else if indexPath.row == 1 {
            return 120
        }else if indexPath.row == 2 {
            return 200
        }else if indexPath.row == 3 {
            return 500
        }else {
            if indexPath.row % 2 != 0 {
                return 410.0
            }else {
                return 570
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    
}

extension HomeViewController : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}

extension HomeViewController: ButtonActionProtocol {

//    func buttonClicked(indexPath: IndexPath) 
    
    func didSelectCollectionView(indexPath: IndexPath, collectionIndexPath: IndexPath?) {
        
        
        if indexPath.row == 0 {
            print("Top Category Clicked")
            let storyboard = UIStoryboard(name: "CategorySubCategoryStoryboard", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "SubCategoryViewController") as! SubCategoryViewController
            mainViewController.subCategory = (self.arrayData[indexPath.row] as? [SubCategory])?[(collectionIndexPath?.row)!]
            self.navigationController?.pushViewController(mainViewController, animated: true)
        }
        else if indexPath.row == 1 {
            print("Coupons Clicked")
            let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "FormViewController") as! FormViewController
            self.navigationController?.pushViewController(mainViewController, animated: true)
        }
        else if indexPath.row == 2 {
            print("Fillers Clicked")
            let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "CouponViewController") as! CouponViewController
            self.navigationController?.pushViewController(mainViewController, animated: true)
        }
        else if indexPath.row == 3 {
            let storyboard = UIStoryboard(name: "DetailsItemStoryboard", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "DetailsItemHomeViewController") as! DetailsItemHomeViewController
            //TODO: send selected id
            mainViewController.itemId = (self.arrayData[indexPath.row] as! [SubCategory])[0].id
            self.navigationController?.pushViewController(mainViewController, animated: true)
        }
        else {
            if indexPath.row % 2 != 0 {
                let storyboard = UIStoryboard(name: "CategorySubCategoryStoryboard", bundle: nil)
                let mainViewController = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
                mainViewController.category = self.arrayData[indexPath.row] as? Category
                self.navigationController?.pushViewController(mainViewController, animated: true)
            }
            else {
                let storyboard = UIStoryboard(name: "CategorySubCategoryStoryboard", bundle: nil)
                let mainViewController = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
                mainViewController.category = self.arrayData[indexPath.row] as? Category
                self.navigationController?.pushViewController(mainViewController, animated: true)
            }
        }
    }
}
extension UIColor{
    open class var randomColor:UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red:red,green:green,blue:blue,alpha:1.0)
        }
    }
}
