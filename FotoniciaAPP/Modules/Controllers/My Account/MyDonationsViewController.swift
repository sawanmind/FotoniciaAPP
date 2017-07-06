//
//  MyDonationsViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 23/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class MyDonationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "MY DONATIONS"
        navigationController?.navigationBar.tintColor = UIColor.black
        self.showLeftBarButtonItemWithImage()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnDonationAction(_ sender: Any)
    {
                
        let storyboard = UIStoryboard(name: "LeftNavigationStoryboard", bundle: nil)
        
        let vcPhoto:DonateTableViewController? = storyboard.instantiateViewController(withIdentifier: "DonateTableViewController") as? DonateTableViewController
        if let viewController = vcPhoto {
            let nav = LeftNavigationViewController(rootViewController: viewController)
            self.present(nav, animated: true) {
            }
        }
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
