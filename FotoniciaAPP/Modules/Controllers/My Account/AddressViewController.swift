//
//  AddressViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 22/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate{
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    var  name = [""]
    var str: NSString!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SAVED ADDRESS"
        navigationController?.navigationBar.tintColor = UIColor.black
        self.showLeftBarButtonItemWithImage()
        //navigationController?.navigationBar.barTintColor = UIColor.cyan
        

        // Do any additional setup after loading the view.
            
//            collectionView.dataSource = self
//            collectionView.delegate   = self
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnActiondelete(_ sender: Any) {
    }

    @IBAction func btnActionEdit(_ sender: Any) {
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return name.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell:UICollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: "AddressCollectionViewCell", for: indexPath) as!AddressCollectionViewCell
        
       
        return cell
    }

    
//    
//    func getAddress() {
//        let dicParams :[String:Any] = ["user_id" : "85","firstname" : self.txtFullname.text!, "lastname" :  "", "city" : self.txtCity.text!, "region" : self.txtState.text!,"postcode" : self.txtPincode.text!, "telephone" : self.txtMobNo.text!, "street" : self.txtaddress.text!,"country_id" : "IN", "prefix" : self.txtSaveAs.text!]
//        
//        //let dicParams:[String : Any] = ["user_details" : dicUserDetails, "device_info" : Device.deviceInfo(), "hash_key" : ""]
//        print("Dic parameters: \(dicParams)")
//        
//        RequestManager().addAddress(parameters: dicParams, loader: true) { (status, responseModel, error) in
//            if status {
//                let alert = UIAlertController(title: "", message: "Your Address succesfully", preferredStyle: .alert)
//                let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
//                    if let response = responseModel as? [String : Any] {
//                        UserDefaults.saveUserInfo(userInfo: response)
//                    }
//                    self.nextView()
//                })
//                alert.addAction(actionOK)
//                self.present(alert, animated: true, completion: {
//                })
//            }else{
//                self.alert(message: "Failed to Signup", title: "")
//                print(error?.localizedDescription as Any)
//            }
//        }
//    }
//
}
