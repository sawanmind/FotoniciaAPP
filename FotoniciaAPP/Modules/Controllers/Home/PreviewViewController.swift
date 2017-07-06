//
//  PreviewViewController.swift
//  FotoniciaAPP
//
//  Created by shadman Alam on 04/07/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    
    
    
    @IBOutlet weak var wanttoshare: UIButton!

    @IBOutlet weak var socialDisplayView: UIView!
    @IBOutlet weak var mainlayoutview: UIView!
    @IBOutlet weak var mainlayoutscrollview: UIScrollView!
    @IBOutlet weak var imageviewmain: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func twitterbutton(_ sender: Any) {
    }

    @IBAction func facebookbutton(_ sender: Any) {
    }
    
    @IBAction func instagrambutton(_ sender: Any) {
    }
    
    @IBAction func whatsappButton(_ sender: Any) {
    }
    
    @IBAction func morebutton(_ sender: Any) {
        
        
        let imagetoshare = UIImage()
         let shareItems:Array = [imagetoshare] as [Any]
        
        let activity: UIActivityViewController = UIActivityViewController(activityItems: [shareItems], applicationActivities: nil)
        
        
        activity.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.mail, UIActivityType.postToTencentWeibo, UIActivityType.postToTencentWeibo, UIActivityType.saveToCameraRoll, UIActivityType.postToFacebook]
        self.present(activity, animated: true, completion: nil)
        
        
    }
    
    @IBAction func wanttoshare(_ sender: Any) {
        
        
      
        if socialDisplayView.isHidden
        {
           // viewDidAppear(true)
        socialDisplayView.isHidden = false
            
//        UIView.animate(withDuration: 0.1, animations: { self.socialDisplayView.frame.origin.y = self.mainlayoutview.frame.origin.y + self.mainlayoutview.frame.size.height})
            UIView.animate(withDuration: 1, animations: {
            
            self.socialDisplayView.transform = CGAffineTransform(scaleX: 1, y: 0.90)
            
            })

//            UIView.animate(withDuration: 1, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: { self.socialDisplayView.frame.origin.y = self.mainlayoutview.frame.origin.y + self.mainlayoutview.frame.size.height}, completion: nil)
//            socialDisplayView.center = CGPoint(x: 0, y: 0)
           
        }else
        {
           
//            UIView.animate(withDuration: 1.0, animations: {
//                self.socialDisplayView.frame.origin.y = self.mainlayoutview.frame.origin.y + self.mainlayoutview.frame.size.height
//                
//            })
            
            
            
            UIView.animate(withDuration: 1, animations: {
                
                self.socialDisplayView.transform = CGAffineTransform(scaleX: 0.75, y: 0.90)
                
            })

            socialDisplayView.isHidden = true

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
