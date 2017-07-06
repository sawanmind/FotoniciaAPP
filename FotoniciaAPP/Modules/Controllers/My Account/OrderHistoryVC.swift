//
//  OrderHistoryVC.swift
//  FotoniciaAPP
//
//  Created by Rajni on 16/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class OrderHistoryVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var lblTotalOrder: UILabel!
    
    var value = ["24,000.00","24,000.00","24,000.00"]
    var points = ["40","40","40",]
    var order = ["100000007","100000007","100000007",]
    var date = ["2017-06-08 07:24:41","2017-06-08 07:24:41","2017-06-08 07:24:41"]
    
    var details = ["Your order is successfully cancelled.","Your order is successfully cancelled.","Your order is successfully cancelled.",]
      
    override func viewDidLoad() {
        super.viewDidLoad()
        getCustmer()

        self.navigationItem.title = "ORDER HISTORY"
        navigationController?.navigationBar.tintColor = UIColor.black
        self.showLeftBarButtonItemWithImage()
        // Do any additional setup after loading the view.
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnActionEditProfile(_ sender: Any)
    {
        let view2 = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController
        self.navigationController?.pushViewController(view2!, animated: true)
    }

   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return value.count
    }
    
    
    
    
    func shareOnSocialMedia() {
        
        //TODO: - Text to share
        let textToShare = "Text to share put here."
        let myWebsite = NSURL(string:"http://www.google.com/")
        
        guard let url = myWebsite else {
            print("nothing found")
            return
        }
        
        let shareItems:Array = [textToShare, url] as [Any]
        
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = [UIActivityType.print, UIActivityType.postToWeibo, UIActivityType.copyToPasteboard, UIActivityType.addToReadingList, UIActivityType.postToVimeo]
        
        
        //present(activityViewController, animated: true, completion: nil)
        
        
        
    }

    
       
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        cell.lblValue.text = value[indexPath.row]
        cell.lblPints.text = points[indexPath.row]
        cell.lblorderNo.text = order[indexPath.row]
        cell.lbldate.text = date[indexPath.row]
        cell.lblMassage.text = details[indexPath.row]
        cell.btncancale.isHidden = false
        return cell
    }
    
    
    func getCustmer() {
        
            let dicParams :[String:Any] = ["user_id" : "85","hash_key" : ""]
            
            //let dicParams:[String : Any] = ["user_details" : dicUserDetails, "device_info" : Device.deviceInfo(), "hash_key" : ""]
            print("Dic parameters: \(dicParams)")
            
            RequestManager().getCustomerOrder(parameters: dicParams, loader: true) { (status, responseModel, error) in
                if status {
                    let alert = UIAlertController(title: "", message: "Customer Order succesfully", preferredStyle: .alert)
                    let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                        if let response = responseModel as? [String : Any] {
                            UserDefaults.saveUserInfo(userInfo: response)
                        }
                       
                    })
                    alert.addAction(actionOK)
                    self.present(alert, animated: true, completion: {
                    })
                }else{
                    self.alert(message: "Failed to Signup", title: "")
                    print(error?.localizedDescription as Any)
                }
            }
        }
    
    }

extension OrderHistoryVC
{
   
   class func shareOnSocialMedia() {
        
        //TODO: - Text to share
        let textToShare = "Text to share put here."
        let myWebsite = NSURL(string:"http://www.google.com/")
        
        guard let url = myWebsite else {
            print("nothing found")
            return
        }
        
        let shareItems:Array = [textToShare, url] as [Any]
        
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = [UIActivityType.print, UIActivityType.postToWeibo, UIActivityType.copyToPasteboard, UIActivityType.addToReadingList, UIActivityType.postToVimeo]
        
        
        //present(activityViewController, animated: true, completion: nil)
        
        
        
    }

}


