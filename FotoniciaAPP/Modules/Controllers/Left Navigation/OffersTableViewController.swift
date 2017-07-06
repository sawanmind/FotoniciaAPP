//
//  OffersTableViewController.swift
//  Photonicia
//
//  Created by Asheesh Verma on 21/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class OffersTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure countryTable
        self.showLeftBarButtonItemWithImage()
        self.tableView.tableFooterView = UIView()
        
        self.tableView.register(UINib(nibName: "OffersTableViewCell", bundle: nil), forCellReuseIdentifier: "OffersTableViewCell")
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100.0

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
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OffersTableViewCell") as! OffersTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

//extension OffersTableViewController : SlideMenuControllerDelegate {
//    
//    func leftWillOpen() {
//        print("SlideMenuControllerDelegate: leftWillOpen")
//    }
//    
//    func leftDidOpen() {
//        print("SlideMenuControllerDelegate: leftDidOpen")
//    }
//    
//    func leftWillClose() {
//        print("SlideMenuControllerDelegate: leftWillClose")
//    }
//    
//    func leftDidClose() {
//        print("SlideMenuControllerDelegate: leftDidClose")
//    }
//    
//    func rightWillOpen() {
//        print("SlideMenuControllerDelegate: rightWillOpen")
//    }
//    
//    func rightDidOpen() {
//        print("SlideMenuControllerDelegate: rightDidOpen")
//    }
//    
//    func rightWillClose() {
//        print("SlideMenuControllerDelegate: rightWillClose")
//    }
//    
//    func rightDidClose() {
//        print("SlideMenuControllerDelegate: rightDidClose")
//    }
//}
