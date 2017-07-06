//
//  nextViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 20/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class nextViewController: UIViewController, UITextViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var borderViewcont: UIView!
    @IBOutlet weak var border1outlet: UIButton!
    @IBOutlet weak var colourborderOut: UIButton!
    var colour = UIButton()
    var border = UIButton()
    @IBOutlet weak var coloroutletbor: UIButton!
    @IBOutlet weak var borderoutlet: UIButton!
    
    @IBOutlet weak var sizeoutlet: UIButton!
    @IBOutlet weak var coloroutlet: UIButton!
    @IBOutlet weak var fontoutlet: UIButton!
    @IBOutlet weak var letteroutlet: UIButton!
    
    @IBOutlet weak var yesletteroutlet: UIButton!
    
    @IBOutlet weak var noletteroutlet: UIButton!
    
    @IBOutlet weak var viewbesideImage: UIView!
    @IBOutlet weak var personliseImage: UIImageView!
    
    @IBOutlet weak var letterboxtopeview: UIView!
  
    @IBOutlet weak var letterboxBottom: UIView!
    @IBOutlet weak var sizeView: UIView!
    @IBOutlet weak var uiview: UIView!
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var textViewText: UITextView!
    
    let step: Float = 5
    
    var setHiddenFlag:Bool = false
    
    
   @IBOutlet weak var lbltextrotation: UILabel!
    
    //let lbltextrotation = UILabel()
    
    @IBAction func tapGesture(_ sender: UIPanGestureRecognizer) {
        
//        
//        if sender .state == .began || sender.state == .changed {
//            
//            let translation = sender.translation(in: self.view)
//            // note: 'view' is optional and need to be unwrapped
//            sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
//            sender.setTranslation(CGPoint.zero, in: self.view)
//        }        
        
    }
        var str: NSString!
    
   var slid = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()

        uiview?.isHidden = true
        sizeView?.isHidden = true
        stepperView?.isHidden = true
     //   lbltextrotation.isHidden = false
        
        letterboxtopeview.isHidden = true
        letterboxBottom.isHidden = true
        texteditout.isHidden = true
        backgroundeditout.isHidden = true
        sizeoutlet.isHidden = true
        coloroutlet.isHidden = true
        fontoutlet.isHidden = true
        letteroutlet.isHidden = true
        slid.isHidden = true
        
     
        self.navigationItem.title = "PERSONALIZE"

        
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.barTintColor = UIColor.cyan
        let navBarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationController?.navigationBar.tintColor = UIColor.black
        self.showLeftBarButtonItemWithImage()
        
        // Do any additional setup after loading the view.
    }
//    
//    func buttonperform(){
//        
//    colour = UIButton(frame: CGRect(x: 0, y: 0, width: 67, height: 10))
//        
//        colour.tintColor = UIColor.white
//        
//        
//        self.sizeView.addSubview(colour)
//    
//    }
    
    
  
    @IBAction func yesletterbutton(_ sender: Any) {
        
        letterboxtopeview.isHidden = false
        letterboxBottom.isHidden = false

        
        
    }
    
    @IBAction func noletterbox(_ sender: Any) {
        
        
        letterboxtopeview.isHidden = true
        letterboxBottom.isHidden = true
        
        
    }
    
    
    
    
    
    @IBOutlet weak var backgroundeditout: UIButton!
    @IBOutlet weak var texteditout: UIButton!
    
    @IBAction func selectaction(_ sender: UIButton){
    
            sizeView.isHidden = false
        
        print(sender.tag)
        
            if sender.tag == 0{
                
            
            sizeoutlet.isHidden = false
            coloroutlet.isHidden = false
            fontoutlet.isHidden = false
            letteroutlet.isHidden = false
                
               
                
            let tap = UITapGestureRecognizer(target: self, action: #selector(hideview(_:)))
//
//            tap.numberOfTapsRequired = 1
//               
            texteditout.addGestureRecognizer(tap)

//            print("Text")
        
        
        
            }else if sender.tag == 0
            {
        sizeView.isHidden = true
                print("View Hidden Succesfully")
        }

       
         if sender.tag == 1 {
      
            //fontoutlet.isHidden = true
            letteroutlet.isHidden = true
            //coloroutlet.isHidden = true
            sizeoutlet.isHidden = true
           // sizeView.isHidden = false
            fontoutlet.setTitle("Border", for: UIControlState.normal)
            coloroutlet.setTitle("Colour", for: UIControlState.normal)

            
            
         print("Background")
            
           

        }
        
        else if sender.tag == 1 {
        
        sizeView.isHidden = true
        }
    
    
    }
    
    func hideview(_ sender: UITapGestureRecognizer){
    
        if sizeView.isHidden == true {
            setHiddenFlag = true
          print("view is hidden")
        }else{
            setHiddenFlag = false
            print("view is not hidden")

        }
    
    }
    @IBAction func textedit(_ sender: Any) {
        
        
        
        if sizeView.isHidden {
        
        sizeView.isHidden = false
            sizeoutlet.isHidden = false
            coloroutlet.isHidden = false
            fontoutlet.isHidden = false
            letteroutlet.isHidden = false
        
        } else {
        
        sizeView.isHidden = true
        }
    }
    @IBAction func backgroundEdit(_ sender: Any) {
        
        if sizeView.isHidden {
           // buttonperform()
            sizeoutlet.isHidden = true
            coloroutlet.isHidden = true
            fontoutlet.isHidden = true
            letteroutlet.isHidden = true
            sizeView.isHidden = false
            
            
            
        
           // stepperView.isHidden = true
        } else
        {
        
            sizeView.isHidden = true
            stepperView.isHidden = true
        
        }
        
        
        
        }
    @IBAction func btnOptionsAction(_ sender: Any)
    {
        
        if uiview.isHidden
        {
            
            uiview.isHidden = false
            texteditout.isHidden = false
            backgroundeditout.isHidden = false
            
//            if sizeView.isHidden
//            {
//                sizeView.isHidden = false
//            }
//            else
//            {
//                sizeView.isHidden = true
//            }

            
            
            
//            let myTextField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200.00, height: 40.00));
//            self.view.addSubview(myTextField)
//            
//            myTextField.backgroundColor = UIColor.red
//            myTextField.text = "some string"
//            myTextField.borderStyle = UITextBorderStyle.line
//            self.view.addSubview(myTextField)

            
                    } else {
            
           
            uiview.isHidden = true
            //texteditout.isHidden = true
            
            
        }
    }

    @IBAction func btnSizesAction(_ sender: Any)
    {
        if uiview.isHidden
        {
            uiview.isHidden = false
            texteditout.isHidden = true
            backgroundeditout.isHidden = true

        } else {
            uiview.isHidden = true
                    }
    }
    @IBAction func btnLayoutsAction(_ sender: Any)
    {
        if uiview.isHidden
        {
            uiview.isHidden = false
            texteditout.isHidden = true
            backgroundeditout.isHidden = true
        } else {
            //uiview.isHidden = true
            uiview.isHidden = true
            sizeView.isHidden = true
            stepperView.isHidden = true
            
            
            

        }
    }
    @IBAction func btnPhotosAction(_ sender: Any)
    {
        if uiview.isHidden
        {
            uiview.isHidden = false
            texteditout.isHidden = true
            backgroundeditout.isHidden = true
        } else {
            uiview.isHidden = true
           

        }
    }
    @IBAction func sizePhoto(_ sender: Any) {
        
        if stepperView.isHidden {
            
            stepperView.isHidden = false
            yesletteroutlet.isHidden = true
            noletteroutlet.isHidden = true
            manageslider()
          
        
        }
            
        else
        {
        stepperView.isHidden = true
        slid.isHidden = true
        }
        
        
        
        
    }
    @IBAction func colorPhoto(_ sender: Any) {
        
        if stepperView.isHidden {
        
           //slid.isHidden = true
            stepperView.isHidden = false
            
            yesletteroutlet.isHidden = true
            noletteroutlet.isHidden = true

            
        }
        else {
        
        stepperView.isHidden = true
            slid.isHidden = true
        }
        
        
    }
    @IBAction func fontPhoto(_ sender: Any) {
        
        if stepperView.isHidden {
            slid.isHidden = true
            stepperView.isHidden = false
        
            yesletteroutlet.isHidden = true
            noletteroutlet.isHidden = true

           

        } else{
        
        stepperView.isHidden = true
            slid.isHidden = true
        }
        
    }
    
    @IBAction func letterboxPhoto(_ sender: Any) {
        
        if stepperView.isHidden {
            
            slid.isHidden = true
            stepperView.isHidden = false
        
            
            yesletteroutlet.isHidden = false
            noletteroutlet.isHidden = false
            
            
            
           

        } else{
            
            stepperView.isHidden = true
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

    func manageslider(){
        
        slid = UISlider(frame: CGRect(x: 0, y: 12, width: 410, height: 10))
        
        slid.minimumValue = 0
        slid.maximumValue = 100
        slid.tintColor = UIColor.blue
        slid.isContinuous = true
        
        self.stepperView.addSubview(slid)
        
    
        
        slid.addTarget(self, action: #selector(slidervalueDidchange(sender:)), for: UIControlEvents.valueChanged)
        
        
        
    
  
    }
    
    func slidervalueDidchange(sender: UISlider!){
      //  self.lbltextrotation.font = UIFont.systemFont(ofSize: CGFloat(slid.value))
        
        
        self.textViewText.font = UIFont.systemFont(ofSize: CGFloat(slid.value))

    
    
    }


//    func gesture(){
//    
//    lbltextrotation?.isUserInteractionEnabled = true
//        
//        let tapgesture1 = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
//        lbltextrotation?.addGestureRecognizer(tapgesture1)
//        self.viewbesideImage?.addGestureRecognizer(tapgesture1)
//       // self.viewbesideImage.addSubview(lbltextrotation)
//        //lbltextrotation.text = "HHhhhHHHHHHHHHHH"
//        //lbltextrotation.textColor = UIColor.red
//        
//       
//        
//        
//    
//    
//    }
//    func handtap(Pgesture: UIPanGestureRecognizer){
//        
//        let translation = Pgesture.translation(in: viewbesideImage)
//        Pgesture.setTranslation(CGPoint.zero, in: viewbesideImage)
//        print(translation)
//        
//        
//        if Pgesture.state == UIGestureRecognizerState.ended{
//            
//            lbltextrotation.frame = CGRect(x: Pgesture.location(in: Pgesture.view).x, y: Pgesture.location(in: Pgesture.view).y, width: 200, height: 100)
//            
//        }
//        
//
//        
//    }
//    func tapHandle(gesture: UITapGestureRecognizer) {
//        
//        print("tapped")
//        
//        if gesture.state == UIGestureRecognizerState.recognized {
//            
//            lbltextrotation.frame = CGRect(x: gesture.location(in: gesture.view).x, y: gesture.location(in: gesture.view).y, width: 200, height: 100)
//            
//            print(gesture.location(in: gesture.view))
//        }
//    }
//
//    lazy var btn: UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
//    
    
    
//    
//    func setupbtn(){
//        viewbesideImage.addSubview(btn)
//        
//        btn.leadingAnchor.constraint(equalTo: viewbesideImage.leadingAnchor).isActive = true
//        btn.trailingAnchor.constraint(equalTo: viewbesideImage.trailingAnchor).isActive = true
//        btn.leadingAnchor.constraint(equalTo: viewbesideImage.leadingAnchor).isActive = true
//        btn.leadingAnchor.constraint(equalTo: viewbesideImage.leadingAnchor).isActive = true
//        
//        lbltextrotation.isUserInteractionEnabled = true
//        lbltextrotation.isMultipleTouchEnabled = true
//    }
//    
    
    

    
    
    
}
