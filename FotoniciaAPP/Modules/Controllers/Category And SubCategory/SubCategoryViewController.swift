//
//  SubCategoryViewController.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 03/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class SubCategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayData = [SubCategoryItems]()
    var category:Category?
    var subCategory:SubCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.showLeftBarButtonItemWithImage()

        //Register TableView
        
        self.tableView.register(UINib(nibName: "SubCategoryListTableViewCell", bundle: nil), forCellReuseIdentifier: "SubCategoryListTableViewCell")

        if let cat = self.category {
            self.title = cat.name.uppercased()
            self.getGetSubCategoryItems(id: cat.id)
        }else if let cat = self.subCategory {
            self.title = cat.name.uppercased()
            self.getGetSubCategoryItems(id: cat.id)
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
    
    func getGetSubCategoryItems(id:String) {
        let dicParams : [String : Any] = ["hash_key" : "", "category_id" : id]
        
        RequestManager().getGetSubCategoryItems(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
                print("Data: \(responseModel ?? [:])")
                
                if let formData = responseModel?["category_item"] as? [[String : Any]] {
                    for dicFormData in formData {
                        if let subCategory = SubCategoryItems(serverData: dicFormData) {
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

extension SubCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryListTableViewCell", for: indexPath) as! SubCategoryListTableViewCell
        cell.subCategoryModel = self.arrayData[indexPath.row]
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
        return 225.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "DetailsItemStoryboard", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "DetailsItemHomeViewController") as! DetailsItemHomeViewController
        //TODO: send selected id
        mainViewController.itemId = self.arrayData[indexPath.row].id
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
}
