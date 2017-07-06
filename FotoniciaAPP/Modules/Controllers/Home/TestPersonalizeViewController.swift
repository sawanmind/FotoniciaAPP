//
//  TestPersonalizeViewController.swift
//  FotoniciaAPP
//
//  Created by shadman Alam on 29/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class TestPersonalizeViewController: UIViewController {
    
    @IBOutlet weak var photoscrollview: UIScrollView!
    
    @IBOutlet weak var selectedImageDispaly: UIImageView!
    @IBOutlet weak var photosImageView: UIView!
    var size = UIButton()
    var colour = UIButton()
    var font = UIButton()
    var letterbox = UIButton()

    @IBOutlet weak var sizetextout: UIButton!
    @IBOutlet weak var colourtextout: UIButton!
    @IBOutlet weak var fonttextout: UIButton!
    @IBOutlet weak var lettertextout: UIButton!
    @IBOutlet weak var colorbackgroundoutlet: UIButton!
    
    @IBOutlet weak var backgroundchangeoutlet: UIButton!
    
    
    @IBOutlet weak var optionoutlet: UIButton!
    @IBOutlet weak var sizeoutlet: UIButton!
    @IBOutlet weak var layoutoutlet: UIButton!
    @IBOutlet weak var photooutlet: UIButton!
    @IBOutlet weak var noOutlet: UIButton!
    @IBOutlet weak var yesOutlet: UIButton!
    @IBOutlet weak var textoutlet: UIButton!
    @IBOutlet weak var backgroundoutlet: UIButton!
    @IBOutlet weak var allbacktext: UIView!
    @IBOutlet weak var textback: UIView!
    @IBOutlet weak var optionview: UIView!
    @IBOutlet weak var textbackgroundview: UIView!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func yesButton(_ sender: Any) {
    }
    
    @IBAction func noButton(_ sender: Any) {
    }

    @IBAction func textbutton(_ sender: Any) {
        
        
      //  if textback.view == UIView.textback{}
        
        if textback.isHidden {
            textback.isHidden = false
            sizetextout.isHidden = false
            colourtextout.isHidden = false
            fonttextout.isHidden = false
            lettertextout.isHidden = false
            colorbackgroundoutlet.isHidden = true
            backgroundchangeoutlet.isHidden = true
            
        }
        else {
            textback.isHidden = true
            allbacktext.isHidden = true
        }

        
        
    }
    
    @IBAction func backgroundbutton(_ sender: Any) {
        
        if textback.isHidden {
        textback.isHidden = false
            sizetextout.isHidden = true
            colourtextout.isHidden = true
            fonttextout.isHidden = true
            lettertextout.isHidden = true
        colorbackgroundoutlet.isHidden = false
        backgroundchangeoutlet.isHidden = false
        
        }else if textback.isHidden == true {
        
        sizetextout.isHidden = true
            
        
        }
            
            
            
        else {
        textback.isHidden = true
        allbacktext.isHidden = true
        }
        
    }
    
    @IBAction func optionbutton(_ sender: Any) {
         //textbackgroundview.isHidden
        if textbackgroundview.isHidden
        {
            textbackgroundview.isHidden = false
        textoutlet.isHidden = false
        backgroundoutlet.isHidden = false
        photosImageView.isHidden = true
        
        }
        else
        
        {
        textbackgroundview.isHidden = true
        
        }
    }
    
    @IBAction func sziebutton(_ sender: UIButton) {
        
        textbackgroundview.isHidden = false
       

        
        
        
       
        
    }
    
    @IBAction func layoutbutton(_ sender: Any) {
        textbackgroundview.isHidden = false
        hideoutlet()
        
    }
    
    @IBAction func photobutton(_ sender: Any) {
        textbackgroundview.isHidden = true
        hideoutlet()
    photosImageView.isHidden = false
        
    }
    
    @IBAction func sizetextbutton(_ sender: Any) {
        
    }
    
    @IBAction func colourtextbutton(_ sender: Any) {
        
    }
    
    @IBAction func fonttextbutton(_ sender: Any) {
    }
    
    @IBAction func lettertextbutton(_ sender: Any) {
        
        if allbacktext.isHidden {
        allbacktext.isHidden = false
        yesOutlet.isHidden = false
        noOutlet.isHidden = false
        
        
        }
        else
        {
        
            allbacktext.isHidden = true
        }
    }
    
    @IBAction func colorbackgroundbutton(_ sender: Any) {
        
    }
    @IBAction func backgroundchangebutton(_ sender: Any) {
        
        
        if allbacktext.isHidden {
        
        allbacktext.isHidden = false
        yesOutlet.isHidden = false
        noOutlet.isHidden = false
        }
        else {
        
        allbacktext.isHidden = true
        }
        
    }

    
    @IBAction func addmorePhoto(_ sender: Any) {
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func hideoutlet(){
    
        textoutlet.isHidden = true
        backgroundoutlet.isHidden = true
        textback.isHidden = true
        allbacktext.isHidden = true
        
        
    
    }

}


//        if sender.tag == 0
//        {
//        textoutlet.isHidden = false
//        backgroundoutlet.isHidden = false
//
//
//        }
//        else if sender.tag == 1
//        {
//
//        hideoutlet()
//
//        }
//        else if sender.tag == 2 {
//
//        hideoutlet()
//
//        }




//        if textbackgroundview.isHidden
//       {
//        textbackgroundview.isHidden = false
//        hideoutlet()
//        }
//       else {
//        textbackgroundview.isHidden = true
//textbackgroundview.didAddSubview(textbackgroundview)
