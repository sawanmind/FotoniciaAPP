//
//  MyReivewViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 24/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class MyReivewViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableview: UITableView!
    
    var name = ["2017-06-08 07:24:41","2017-06-08 07:24:41"]
    
    var details = ["sadasdasa","sharma"]
    var titels = ["must ji","ldbvnjdj"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "MY REIVEW"
        navigationController?.navigationBar.tintColor = UIColor.black
        self.showLeftBarButtonItemWithImage()


        MyReview() 
        // Do any additional setup after loading the view.
        
        tableview.delegate = self
        tableview.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
      return name.count
    }
    
    
    
   
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
         let cell = tableview.dequeueReusableCell(withIdentifier: "MyReviewTableViewCell", for: indexPath) as! MyReviewTableViewCell
        cell.lbldateandtime.text = name[indexPath.row]
        cell.detials.text = titels[indexPath.row]
        cell.lblname.text = details[indexPath.row]
        return cell
    }

    
    
    func MyReview() {
        
        let dicParams :[String:Any] = ["user_id" : "85","hash_key" : "",]
        
        //let dicParams:[String : Any] = ["user_details" : dicUserDetails, "device_info" : Device.deviceInfo(), "hash_key" : ""]
        print("Dic parameters: \(dicParams)")
        
        RequestManager().submitReviewAndRating(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
                //                let alert = UIAlertController(title: "", message: "ReOrder Order succesfully", preferredStyle: .alert)
                //                let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                //                    if let response = responseModel as? [String : Any] {
                //                        UserDefaults.saveUserInfo(userInfo: response)
                //                    }
                //
                //                })
                //                alert.addAction(actionOK)
                //                self.present(alert, animated: true, completion: {
                //                })
                //            }else{
                //                self.alert(message: "Failed to Signup", title: "")
                //                print(error?.localizedDescription as Any)
                //            }
            }
        }


    }
}
