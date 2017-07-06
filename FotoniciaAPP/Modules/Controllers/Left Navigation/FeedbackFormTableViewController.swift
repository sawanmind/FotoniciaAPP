//
//  FeedbackFormTableViewController.swift
//  Photonicia
//
//  Created by Asheesh Verma on 21/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class FeedbackFormTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.showLeftBarButtonItemWithImage()
        
        //navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        self.navigationItem.title = "FEEDBACK"
        
        
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.barTintColor = UIColor.cyan
        let navBarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationController?.navigationBar.tintColor = UIColor.black
      
        
        
        // You can change the background color
        //navigationController?.navigationBar.barTintColor =  UIColor(red: 49/255, green: 75/255, blue: 108/255, alpha: 1.0)
        //UIColor(red: 1 / 255, green: 47 / 255, blue: 66 / 255, alpha: 1)


        // Configure countryTable
        self.tableView.tableFooterView = UIView()
        
        self.tableView.register(UINib(nibName: "FeedbackMultipleOptionTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedbackMultipleOptionTableViewCell")
        
        self.tableView.estimatedRowHeight = 110.0

        self.tableView.rowHeight = UITableViewAutomaticDimension
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedbackMultipleOptionTableViewCell") as! FeedbackMultipleOptionTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
        headerText.backgroundColor = UIColor.white
        headerText.textColor = UIColor(red: 74/255, green: 75/255, blue: 71/255, alpha: 1)
        headerText.adjustsFontSizeToFitWidth = true
        headerText.textAlignment = .center
        headerText.text = "Please take a few minutes to give us feedback about our service by filling in this short Customer Feedback Form. We are conducting this research in order to measure your level of satisfaction with the quality of our service"
        
        return headerText
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension

    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
}

extension FeedbackFormTableViewController : SlideMenuControllerDelegate {
    
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
