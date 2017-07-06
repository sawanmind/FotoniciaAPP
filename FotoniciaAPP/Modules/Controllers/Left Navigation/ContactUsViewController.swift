//
//  ContactUsViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 14/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        // You can change the background color
        navigationController?.navigationBar.barTintColor =  UIColor(red: 49/255, green: 75/255, blue: 108/255, alpha: 1.0)
        //UIColor(red: 1 / 255, green: 47 / 255, blue: 66 / 255, alpha: 1)
        
        // You can add a logo on it
        let navBarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navBarImageView.contentMode = .scaleAspectFit
        let navBarImage = UIImage(named: "myNavBarLogo.png")
        navBarImageView.image = navBarImage
        navigationItem.titleView = navBarImageView
        
        //You can change the text color
        navigationController?.navigationBar.tintColor = UIColor.black
        
        //You can change the font
        if let font = UIFont(name: "AppleSDGothicNeo-Thin", size: 34) {
            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: font]
        }
        
        self.showLeftBarButtonItemWithImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.shareOnSocialMedia()
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
        
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}

