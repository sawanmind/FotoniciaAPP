//
//  RateUsViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 14/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class RateUsViewController: UIViewController, UIWebViewDelegate {
    
     var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        self.navigationItem.title = "RATE US"
        
        
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.barTintColor = UIColor.cyan
        let navBarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationController?.navigationBar.tintColor = UIColor.black
        self.showLeftBarButtonItemWithImage()
        
        
        // You can change the background color
        navigationController?.navigationBar.barTintColor =  UIColor(red: 49/255, green: 75/255, blue: 108/255, alpha: 1.0)
        //UIColor(red: 1 / 255, green: 47 / 255, blue: 66 / 255, alpha: 1)

        
        
//        navigationController?.navigationBar.barStyle = UIBarStyle.black
//        
//        // You can change the background color
//        navigationController?.navigationBar.barTintColor =  UIColor(red: 49/255, green: 75/255, blue: 108/255, alpha: 1.0)
//        //UIColor(red: 1 / 255, green: 47 / 255, blue: 66 / 255, alpha: 1)
//        
//        // You can add a logo on it
//        let navBarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//        navBarImageView.contentMode = .scaleAspectFit
//        let navBarImage = UIImage(named: "myNavBarLogo.png")
//        navBarImageView.image = navBarImage
//        navigationItem.titleView = navBarImageView
//        
//        //You can change the text color
//        navigationController?.navigationBar.tintColor = UIColor.black
//        
//        //You can change the font
//        if let font = UIFont(name: "AppleSDGothicNeo-Thin", size: 34) {
//            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: font]
//        }
//        
//        self.showLeftBarButtonItemWithImage()
        
        // Configure countryTable
//        self.tableView.tableFooterView = UIView()
//        
//        self.tableView.register(UINib(nibName: "AboutUsTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutUsTableViewCell")
//        
//        self.tableView.rowHeight = UITableViewAutomaticDimension
//        self.tableView.estimatedRowHeight = 216.0
        
        
        

        // Do any additional setup after loading the view.
        webView = UIWebView(frame: UIScreen.main.bounds)
        webView.delegate = self
        view.addSubview(webView)
        if let url = URL(string: "https://play.google.com/store/apps/details?id=in.kpis.immortalize") {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
