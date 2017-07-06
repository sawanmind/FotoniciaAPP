//
//  FollowUsViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 28/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class FollowUsViewController: UIViewController, UIWebViewDelegate {
    
    var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        self.navigationItem.title = "FOLLOW US"
        
        
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
       // navigationController?.navigationBar.barTintColor = UIColor.cyan
        let navBarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationController?.navigationBar.tintColor = UIColor.black
        self.showLeftBarButtonItemWithImage()
        
        
        // You can change the background color
        navigationController?.navigationBar.barTintColor =  UIColor(red: 49/255, green: 75/255, blue: 108/255, alpha: 1.0)
        //UIColor(red: 1 / 255, green: 47 / 255, blue: 66 / 255, alpha: 1)
        
        
        
        // Do any additional setup after loading the view.
        webView = UIWebView(frame: UIScreen.main.bounds)
        webView.delegate = self
        view.addSubview(webView)
        if let url = URL(string: "https://www.instagram.com/") {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
