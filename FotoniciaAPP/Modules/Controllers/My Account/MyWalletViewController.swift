//
//  MyWalletViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 24/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class MyWalletViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var name = ["Buy One get one free","Buy One get one free","Buy One get one free","Buy One get one free","Buy One get one free","Buy One get one free","Buy One get one free","Buy One get one free","Buy One get one free"]
    var offerDetils = ["Buy One get one free","Buy One get one free","Buy One get one free","Buy One get one free","Buy One get one free","Buy One get one free","Buy One get one free","Buy One get one free","Buy One get one free"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "MY WALLET"
        navigationController?.navigationBar.tintColor = UIColor.black
        self.showLeftBarButtonItemWithImage()

        
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
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
        let cell = tableview.dequeueReusableCell(withIdentifier: "MyWalletTableViewCell", for: indexPath) as! MyWalletTableViewCell
        cell.lblName.text = name[indexPath.row]
       // cell.detials.text = titels[indexPath.row]
        cell.lbloffer.text = offerDetils[indexPath.row]
        return cell
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
