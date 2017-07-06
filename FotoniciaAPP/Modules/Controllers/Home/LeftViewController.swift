//
//  LeftViewController.swift
//  Photonicia
//
//  Created by Asheesh Verma on 21/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

enum LeftMenu: Int {
    
    case aboutUs = 0
    case myAccount
    case referAndEarn
    case offer
    case donateToEducate
    case helpAndFAQ
    case likeUs
    case FollowUs
    case rateUs
    case contactUs
    case feedback
    case photo

}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController : UIViewController, LeftMenuProtocol {
    func changeViewController(_ menu: LeftMenu) {
    }

    
    @IBOutlet weak var tableView: UITableView!
    var menus = ["About Us", "My Account", "Refer and Earn", "Offers", "Donate to Educate", "Help & FAQ", "Like Us","Follow Us", "Rate Us", "Contact Us", "Feedback"]
     var image = ["ic_home_white_2x","myprofile_white.png","refer_white.png","offers_white.png","donate_white.png","help_white.png","like_white.png","ic_supervisor_account_white_2x","rating_selected_white.png","contact_white.png","feedback_white.png"]
    
    @IBOutlet weak var imgViewUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    
    var mainViewController: UIViewController!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        //self.tableView.separatorColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        
       // self.tableView.separatorColor = UIColor(hex: "E0E0E0")

//        self.view.backgroundColor = UIColor(hex: "E0E0E0")
        
        if UserDefaults.getUserLoginStatus() {
            self.lblUserName.text = UserDefaults.getUserName()
            self.lblUserEmail.text = UserDefaults.getUserEmail()
        }else {
            self.lblUserName.text = "Guest User"
            self.lblUserEmail.text = ""
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.layoutIfNeeded()
    }
    
    func showHideMenu(menu:Int) {
        self.toggleLeft()
        NotificationCenter.default.post(name: .NotificationSideMenuHome, object: nil, userInfo: ["Row" : menu])
    }
    @IBAction func tapGesturePhoto(_ sender: UITapGestureRecognizer) {
        if let menu = LeftMenu(rawValue: 11) {
            self.showHideMenu(menu: menu.rawValue)
        }
    }
}

extension LeftViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if UserDefaults.getUserLoginStatus() {
            if let menu = LeftMenu(rawValue: indexPath.row) {
                self.toggleLeft()
                NotificationCenter.default.post(name: .NotificationSideMenuHome, object: nil, userInfo: ["Row" : menu.rawValue])
            }
        }else {
            if indexPath.row == 1 {
                let alertController = UIAlertController(title: "Alert", message: "You have not logged in.", preferredStyle: .alert)
                
                let login = UIAlertAction(title: "Login", style: .default, handler: { (alert) in
                    self.setRootLoginView()
                })
                let signUp = UIAlertAction(title: "Signup", style: .default, handler: { (alert) in
                    self.setRootRegisterView()
                })
                
                alertController.addAction(login)
                alertController.addAction(signUp)
                self.present(alertController, animated: true, completion: {
                })
            }else {
                if let menu = LeftMenu(rawValue: indexPath.row) {
                    self.showHideMenu(menu: menu.rawValue)
                }
            }
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //cell.contentView.backgroundColor = UIColor.yellow
       // cell.contentView.backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.9, alpha: 1.0)
        //cell.contentView.backgroundColor = UIColor(white: 0xF0F0F0, alpha: 0.9)

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

extension LeftViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftMenuTableViewCell", for: indexPath) as! LeftMenuTableViewCell
        cell.lblTitle?.text = menus[indexPath.row]
        if indexPath.row < 11 {
            cell.imgView?.image = UIImage(named: image[indexPath.row])
        }
        return cell
    }
}
