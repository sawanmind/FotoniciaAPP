//
//  ReviewAndRatingsContainerViewController.swift
//  Photonicia
//
//  Created by Asheesh Verma on 22/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class ReviewAndRatingsContainerViewController: UIViewController {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var btnRatingAndReview: UIButton!
    @IBOutlet weak var btnWriteAReview: UIButton!
    var isMenu = true
    var itemId:String!
    
    private lazy var reviewAndRatingsViewController: ReviewAndRatingsViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "LeftNavigationStoryboard", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "ReviewAndRatingsViewController") as! ReviewAndRatingsViewController
        viewController.itemId = self.itemId
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var writeReviewAndRatingsViewController: WriteReviewAndRatingsViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "LeftNavigationStoryboard", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "WriteReviewAndRatingsViewController") as! WriteReviewAndRatingsViewController
        viewController.itemId = self.itemId

        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.showLeftBarButtonItemWithImage()

        let str = NSMutableAttributedString(string: "WRITE A REVIEW\nEarn 20 points on submitting every review*")
        str.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 15), range: NSMakeRange(0, 14))
        str.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 7), range: NSMakeRange(15, 42))
        self.btnWriteAReview.setAttributedTitle(str, for: .normal)
        self.btnWriteAReview.titleLabel?.textAlignment = .center
        
        self.updateView(tag: self.btnRatingAndReview.tag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isMenu {
            self.setNavigationBarItem()
        }
    }

    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        self.viewContainer.addSubview(viewController.view)
        
        // Configure Child View
        var frame = view.bounds
        let y = frame.origin.y + self.btnRatingAndReview.frame.size.height
        let h = frame.height - self.btnRatingAndReview.frame.size.height
        viewController.view.frame =  self.viewContainer.bounds//CGRect(x: 0, y: y, width: frame.width, height: h)
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    private func updateView(tag:Int) {
        if tag == 0 {
            
            self.btnRatingAndReview.backgroundColor = UIColor(red: 60/255, green: 82/255, blue: 162/255, alpha: 1)
            self.btnRatingAndReview.setTitleColor(UIColor.white, for: .normal)
            
            self.btnWriteAReview.backgroundColor = UIColor.lightGray
            
            let str = NSMutableAttributedString(string: "WRITE A REVIEW\nEarn 20 points on submitting every review*")
            str.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 15), range: NSMakeRange(0, 14))
            str.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 7), range: NSMakeRange(15, 42))
            
            
            str.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 60/255, green: 82/255, blue: 162/255, alpha: 1) , range: NSMakeRange(0, 14))
            str.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 60/255, green: 82/255, blue: 162/255, alpha: 1) , range: NSMakeRange(15, 42))
            self.btnWriteAReview.setAttributedTitle(str, for: .normal)
            self.btnWriteAReview.titleLabel?.textAlignment = .center


            
            remove(asChildViewController: writeReviewAndRatingsViewController)
            add(asChildViewController: reviewAndRatingsViewController)
        } else {
            self.btnWriteAReview.backgroundColor = UIColor.black//UIColor(red: 60/255, green: 82/255, blue: 162/255, alpha: 1)
            self.btnWriteAReview.setTitleColor(UIColor.white, for: .normal)
            
            self.btnRatingAndReview.backgroundColor = UIColor.lightGray
            self.btnRatingAndReview.setTitleColor(UIColor(red: 60/255, green: 82/255, blue: 162/255, alpha: 1), for: .normal)
            
            
            let str = NSMutableAttributedString(string: "WRITE A REVIEW\nEarn 20 points on submitting every review*")
            str.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 15), range: NSMakeRange(0, 14))
            str.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 7), range: NSMakeRange(15, 42))
            
            str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white , range: NSMakeRange(0, 14))
            str.addAttribute(NSForegroundColorAttributeName, value: UIColor.white , range: NSMakeRange(15, 42))
            
            self.btnWriteAReview.setAttributedTitle(str, for: .normal)
            self.btnWriteAReview.titleLabel?.textAlignment = .center

            
            remove(asChildViewController: reviewAndRatingsViewController)
            add(asChildViewController: writeReviewAndRatingsViewController)
        }
    }

    @IBAction func btnRatingAndReviewAction(_ sender: UIButton) {
        self.updateView(tag: sender.tag)
    }
    @IBAction func btnWriteAReviewAction(_ sender: UIButton) {
        self.updateView(tag: sender.tag)
    }

}
