//
//  CategoryViewController.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 03/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayData = [SubCategory]()
    var category:Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.showLeftBarButtonItemWithImage()
        //Register TableView
        
        self.tableView.register(UINib(nibName: "CategoryListTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryListTableViewCell")
        self.tableView.reloadData()
        if let cat = self.category {
            self.title = cat.name.uppercased()
            self.getSubCategory()
        }
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
    
    func getSubCategory() {
        let dicParams : [String : Any] = ["hash_key" : "", "user_id": "", "category_id" : self.category!.id]
        
        RequestManager().getSubCategory(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
                print("Data: \(responseModel ?? [:])")
                
                if let arraySubCategoryDetails = responseModel?["sub_category_details"] as? [[String : Any]] {
                    for dicSubCategoryDetails in arraySubCategoryDetails {
                        if let subCategory = SubCategory(serverSubCategoryDetialsData: dicSubCategoryDetails) {
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

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListTableViewCell", for: indexPath) as! CategoryListTableViewCell
        cell.indexPath = indexPath
        cell.imgView.backgroundColor = UIColor.randomColor
//        cell.lblTitle.backgroundColor = UIColor.randomColor
        cell.categoryModel = self.arrayData[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            cell.constraintLeftImgView.constant = 12
            cell.constraintRightImgView.constant = 100 + 13
            
            cell.constraintLeftLblTitle.constant = cell.bounds.width - 100 + 12
            cell.constraintRightLblTitle.constant = 13
            cell.lblTitle.textAlignment = .center
            
        }else {
            cell.constraintLeftImgView.constant = 100 + 12
            cell.constraintRightImgView.constant = 13
            
            cell.constraintLeftLblTitle.constant = 12
            cell.constraintRightLblTitle.constant = cell.bounds.width - 100 + 13
            cell.lblTitle.textAlignment = .center
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = UIColor.randomColor
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "CategorySubCategoryStoryboard", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "SubCategoryViewController") as! SubCategoryViewController
        mainViewController.category = self.category
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
}

