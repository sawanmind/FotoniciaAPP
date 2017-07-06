//
//  MyAccountTableViewController.swift
//  Photonicia
//
//  Created by Asheesh Verma on 27/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class MyAccountTableViewController: UITableViewController {
    var arrayData = ["Order History", "My Donations", "My Wallet(450 Points)","My Reviews", "My Wishlist", "My Tags","My Address", "Change Password", "Sign Out"]
    
    //let image = "profile_pic.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //self.navigationController?.isNavigationBarHidden = true
        //self.navigationItem.title = "HELP AND FAQ"
        
        
        
        //navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        //let navBarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationController?.navigationBar.tintColor = UIColor.gray
        self.showLeftBarButtonItemWithImage()

        // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "profile_pic.jpg")!)
        self.showLeftBarButtonItemWithImage()

        // Configure countryTable
        self.tableView.register(UINib(nibName: "MyAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "MyAccountTableViewCell")
        
        self.tableView.tableFooterView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnBackAction(_ sender: UIBarButtonItem) {
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyAccountTableViewCell") as? MyAccountTableViewCell
        
        cell?.lblTitle.text = self.arrayData[indexPath.row].uppercased()
      
        //cell?.lblTitle.backgroundColor = UIColor.cyan
        
//        if indexPath.row == self.arrayData.count - 1 {
//            cell?.separatorView.isHidden = true
//            cell?.constraintHeightSeparatorView.constant = 0
//            cell?.lblTitle.textAlignment = .center
//            cell?.lblTitle.textColor = UIColor.white
//            cell?.backgroundColor = UIColor.cyan
//            }else {
//                        //cell?.imgViewDottted.isHidden = true
//            cell?.separatorView.isHidden = true
//            cell?.constraintHeightSeparatorView.constant = 0
//            }

        if indexPath.row == self.arrayData.count - 3 {
            //cell?.imgViewDottted.isHidden = true
            cell?.separatorView.isHidden = false
            cell?.constraintHeightSeparatorView.constant = 1
        }else if indexPath.row == self.arrayData.count - 2 {
            //cell?.imgViewDottted.isHidden = true
            cell?.separatorView.isHidden = false
            cell?.constraintHeightSeparatorView.constant = 2
        }else if indexPath.row == self.arrayData.count - 1 {
            //cell?.imgViewDottted.isHidden = false
            cell?.separatorView.isHidden = true
            cell?.constraintHeightSeparatorView.constant = 0
            cell?.lblTitle.textAlignment = .center
            cell?.lblTitle.textColor = UIColor.white
            cell?.backgroundColor = UIColor.cyan
        }else {
            //cell?.imgViewDottted.isHidden = true
            cell?.separatorView.isHidden = true
            cell?.constraintHeightSeparatorView.constant = 0
        }
        if indexPath.row == self.arrayData.count - 1 {
            cell?.lblTitle.textAlignment = .center
            cell?.accessoryType = .none
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 25.0)
        }else {
            cell?.accessoryType = .disclosureIndicator
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == self.arrayData.count - 1 {
            
            UserDefaults.removeUserInfo()
            self.setRootLoginAndRegisterationView()
        }
            else if indexPath.row == self.arrayData.count - 2 {
            
            
            
            let alertController: UIAlertController = UIAlertController(title: "Change Password", message: nil, preferredStyle: .alert)
            
            var password = ""
            let submitAction = UIAlertAction(title: "SUBMIT", style: .default) { [weak alertController] _ in
                if let alertController = alertController {
                    let loginTextField = alertController.textFields![0] as UITextField
                    password = loginTextField.text!
                    changePassword(password: password)
                }
            }
            submitAction.isEnabled = false
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
            
            alertController.addTextField { textField in
                textField.placeholder = "Change Password"
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange, object: textField, queue: OperationQueue.main) { notification in
                    submitAction.isEnabled = textField.text != ""
                }
            }
            
            alertController.addAction(submitAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
         else if indexPath.row == self.arrayData.count - 3 {
            
            
            let nextData = self.storyboard?.instantiateViewController(withIdentifier: "AddressViewController") as!AddressViewController
            
           // nextData.str = ""
            // nextData.str =  (self.colorsDict[indexPath.indexPath.section]?[indexPath.row]as? [String : String])
            //nextData.str1 = (self.arrMyData[(indexPath as NSIndexPath).row] as? [String : String])?["name"] as NSString!
            //nextData.str2 = (self.arrMyData[(indexPath as NSIndexPath).row] as? [String : String])?["offline"] as NSString!
            
            
            self.navigationController?.pushViewController(nextData, animated: true)

        }
        else if indexPath.row == self.arrayData.count - 4 {
            
            
            let nextData = self.storyboard?.instantiateViewController(withIdentifier: "MyTagsViewController") as!MyTagsViewController
            
                       
            
            self.navigationController?.pushViewController(nextData, animated: true)
            
        }
        else if indexPath.row == self.arrayData.count - 5 {
            
            
            let nextData = self.storyboard?.instantiateViewController(withIdentifier: "MyWishlistViewController") as!MyWishlistViewController
            
            
            
            self.navigationController?.pushViewController(nextData, animated: true)
            
        }
        else if indexPath.row == self.arrayData.count - 6 {
            
            
            let nextData = self.storyboard?.instantiateViewController(withIdentifier: "MyReivewViewController") as!MyReivewViewController         
            
            
            
            self.navigationController?.pushViewController(nextData, animated: true)
            
        }
        else if indexPath.row == self.arrayData.count - 7 {
            
            
            let nextData = self.storyboard?.instantiateViewController(withIdentifier: "MyWalletViewController") as!MyWalletViewController
            self.navigationController?.pushViewController(nextData, animated: true)
            
        }
        else if indexPath.row == self.arrayData.count - 8 {
            
            
            let nextData = self.storyboard?.instantiateViewController(withIdentifier: "MyDonationsViewController") as!MyDonationsViewController
            
            self.navigationController?.pushViewController(nextData, animated: true)
            
        }
        else if indexPath.row == self.arrayData.count - 9 {
            
            
            let nextData = self.storyboard?.instantiateViewController(withIdentifier: "OrderHistoryVC") as!OrderHistoryVC
            
            self.navigationController?.pushViewController(nextData, animated: true)
            
        }


        
            func changePassword(password: String) {
                //let dicUserDetails :[String:Any] = ["password" : password]
                
                let dicParams:[String : Any] = ["user_id" : "83","password": password, "hash_key" : ""]
                //print("Dic parameters: \(dicParams)")
                
                
                RequestManager().changePassword(parameters: dicParams, loader: true) { (status, responseModel, error) in
                    if status {
                        let alert = UIAlertController(title: "", message: "Password Change succesfully", preferredStyle: .alert)
                        let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                            if let response = responseModel as? [String : Any] {
                                UserDefaults.saveUserInfo(userInfo: response)
                            }
                        })
                        alert.addAction(actionOK)
                        self.present(alert, animated: true, completion: {
                        })
                    }else{
                        self.alert(message: "Password Change Not succesfully", title: "")
                        print(error?.localizedDescription as Any)
                    }
                }
        
//                func MyWishlist(id:String) {
//                    let dicParams : [String : Any] = ["hash_key" : "", "category_id" : id]
//                    
//                    RequestManager().MyWishlist(parameters: dicParams, loader: true) { (status, responseModel, error) in
//                        if status {
//                            print("Data: \(responseModel ?? [:])")
//                            
//                            if let formData = responseModel?["category_item"] as? [[String : Any]] {
//                                for dicFormData in formData {
//                                    if let subCategory = MyWishlist(id: dicFormData) {
//                                        self.arrayData.append(MyWishlist)
//                                    }
//                                }
//                            }
//                            self.tableView.reloadData()
//                            
//                        }else {
//                            print("Error: \(error?.localizedDescription as Any)")
//                        }
//                    }
//                    

            
            
            //let selectedName = arrayData[indexPath.row]
            
           // let newView: OrderHistoryVC = self.storyboard?.instantiateViewController(withIdentifier: "OrderHistoryVC") as! OrderHistoryVC
            
            //newView.label.text = selectedName
            //self.present(newView, animated: true, completion: nil)
            
                
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let view = UIView()
//        let image = UIImageView()
//        
//        let screenSize: CGRect = UIScreen.main.bounds
//        image.frame = CGRect(x: 0, y: 0, width: 50, height: screenSize.height * 0.2)
        
         view.backgroundColor = UIColor(patternImage: UIImage(named: "profile_pic.jpg")!)
//        let imageName = "yourImage.png"
//        yourview.backgroundColor = UIColor.colorWithPatternImage(UIImage(named:imageName))
        //view.backgroundColor = UIColor.randomColor
       
       //return image
        return view
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200.0
    }
}

