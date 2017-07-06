//
//  ExSlideMenuController.swift
//  Photonicia
//
//  Created by Asheesh Verma on 21/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class ExSlideMenuController: SlideMenuController {
    
    override func isTagetViewController() -> Bool {
        if let vc = UIApplication.topViewController() {
            if vc is HomeViewController ||
                vc is AboutUsTableViewController ||
                vc is OffersTableViewController ||
                vc is ReviewAndRatingsContainerViewController ||
                vc is FeedbackFormTableViewController ||
                vc is OffersTableViewController {
                return true
            }
        }
        return false
    }
    
    override func track(_ trackAction: TrackAction) {
        switch trackAction {
        case .leftTapOpen:
            print("TrackAction: left tap open.")
        case .leftTapClose:
            print("TrackAction: left tap close.")
        case .leftFlickOpen:
            print("TrackAction: left flick open.")
        case .leftFlickClose:
            print("TrackAction: left flick close.")
        case .rightTapOpen:
            print("TrackAction: right tap open.")
        case .rightTapClose:
            print("TrackAction: right tap close.")
        case .rightFlickOpen:
            print("TrackAction: right flick open.")
        case .rightFlickClose:
            print("TrackAction: right flick close.")
        }
    }
}


extension UIViewController {
    
    func setNavigationBarItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "MenuIcon-1")!)
//        self.addRightBarButtonWithImage(UIImage(named: "SideMenu")!)
        self.slideMenuController()?.removeLeftGestures()
//        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
//        self.slideMenuController()?.addRightGestures()
    }
    
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
//        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
//        self.slideMenuController()?.removeRightGestures()
    }
}
