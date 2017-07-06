//
//  UIKitExtesion.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 11/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        if let slide = viewController as? SlideMenuController {
            return topViewController(slide.mainViewController)
        }
        return viewController
    }
}


extension UIViewController{
    func alert(message:String, title:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
        }
        
        alert.addAction(actionOK)
        self.present(alert, animated: true) {
        }
    }
    
    var window: UIWindow! {
        return ((UIApplication.shared.delegate?.window)!)!
    }
    
    
    func setRootMenuView() {
        
        // create viewController code...
        let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let leftViewController = storyboard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        let rightViewController = storyboard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        
        
        leftViewController.mainViewController = nvc
        SlideMenuOptions.panGesturesEnabled = false
        let slideMenuController = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController, rightMenuViewController: rightViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = mainViewController
        self.window.rootViewController = slideMenuController
        self.window.makeKeyAndVisible()
    }
    
    func setRootLoginAndRegisterationView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        mainViewController.status = "0"
        self.window.rootViewController = mainViewController
        self.window.makeKeyAndVisible()
    }
    
    func setRootRegisterView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        mainViewController.status = "2"
        self.window.rootViewController = mainViewController
        self.window.makeKeyAndVisible()
    }
    
    func setRootLoginView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        mainViewController.status = "1"
        self.window.rootViewController = mainViewController
        self.window.makeKeyAndVisible()
    }
    
}


public extension UIViewController {
    public func showRightBarButtonItem(withImage image: UIImage?) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.rightBarButtonItemTapped))
    }
    
    public func showRightBarButtonItem(withTitle title: String) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(self.rightBarButtonItemTapped))
    }
    
    public func showRightBarButtonItem(withSystemItem item: UIBarButtonSystemItem) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: item, target: self, action: #selector(self.rightBarButtonItemTapped))
    }
    
    func rightBarButtonItemTapped() {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }else {
            self.dismiss(animated: true, completion: {})
        }
    }
    
    
    public func showLeftBarButtonItemWithImage( image: UIImage? = UIImage(named: "ic_keyboard_backspace_white_2x")) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.backBarButtonItemTapped))
    }
    
    public func showLeftBarButtonItemWithTitle( title: String = "Back", actionHandler: ((UIBarButtonItem) -> ())?) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(self.backBarButtonItemTapped))
    }
    
    public func showLeftBarButtonItemWithSystemItem( item: UIBarButtonSystemItem, actionHandler: ((UIBarButtonItem) -> ())?) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: item, target: self, action: #selector(self.backBarButtonItemTapped))
    }
    
    func backBarButtonItemTapped() {
        if let nav = self.navigationController {
            if nav.viewControllers.count > 1 {
                nav.popViewController(animated: true)
            }else {
                self.dismiss(animated: true, completion: {})
            }
        }else {
            self.dismiss(animated: true, completion: {})
        }
    }
    
}
