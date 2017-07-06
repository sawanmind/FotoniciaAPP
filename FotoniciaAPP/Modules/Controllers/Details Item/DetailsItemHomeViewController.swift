//
//  DetailsItemHomeViewController.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 03/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class DetailsItemHomeViewController: UIViewController {

    @IBOutlet weak var viewRating: RatingView!
    @IBOutlet weak var btnFavourite: UIButton!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnTag: UIButton!
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var lblReviewCount: UILabel!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewReviewRating: UIView!
    @IBOutlet weak var viewMore: UIView!
    @IBOutlet weak var lblMoreDetails: UILabel!
    
    var timer:Timer?
    private let height = UIScreen.main.bounds.height - 64
    private let width = UIScreen.main.bounds.size.width
    private let TimerInterval = 5.0
//    var arraySliderModel = [SubCategory]()
    var itemId:String?
    var itemDetails:ItemInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showLeftBarButtonItemWithImage()


        self.btnMore.layer.cornerRadius = self.btnMore.frame.size.height/2
        self.btnMore.layer.masksToBounds = true
        self.btnMore.layer.borderWidth = 2
        self.btnMore.layer.borderColor = UIColor.white.cgColor
        
        self.btnMore.setTitleColor(UIColor.white, for: .normal)
        self.btnMore.backgroundColor = UIColor.clear
        
        self.btnCreate.layer.cornerRadius = self.btnMore.frame.size.height/2
        self.btnCreate.layer.masksToBounds = true
        self.btnCreate.setTitleColor(UIColor.black, for: .normal)
        self.btnCreate.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
        if let _ = self.itemId {
            self.getItemDetails()
        }
//        self.setUpScrollView()
//        if timer == nil{
//            timer = Timer.scheduledTimer(timeInterval: TimerInterval, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        if let timer = self.timer{
            timer.invalidate()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let con = segue.destination as? YoutubeViewController {
            con.videoId = self.itemDetails?.videoId
        }
    }
    
    func setUpScrollView() {
        if let name = self.itemDetails?.name , let createionTime = self.itemDetails?.creationTime {
            self.lblMoreDetails.text = name + "\n\nColor: " + name + "\n\nCreation Time: " + createionTime
        }
        
        
        self.viewRating.rating = self.itemDetails!.itemRating.floatSafeValue()
        if self.itemDetails!.itemRatingReviewCount.intSafeValue() > 1 {
            self.lblReviewCount.text = self.itemDetails!.itemRatingReviewCount + " Reviews"
        }else if self.itemDetails!.itemRatingReviewCount.intSafeValue() > 0 {
            self.lblReviewCount.text = self.itemDetails!.itemRatingReviewCount + " Review"
        }else {
            self.lblReviewCount.text = "No Review"
        }
        
        scrollView.frame = CGRect(x: 0, y: 0, width: width,height: height)
        scrollView.delegate = self
        self.pageControl.numberOfPages = self.itemDetails!.arrayImageURL.count
        
        for i in 0..<self.itemDetails!.arrayImageURL.count{
            let xPosition = width * CGFloat(i)
            
            let imageView = UIImageView()
            imageView.frame = CGRect(x: xPosition, y: 0, width: width, height: height)
            imageView.contentMode = .scaleToFill
            let url = self.itemDetails!.arrayImageURL[i]
            if url.characters.count > 0 {
                imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named:"item_image_placeholder"), options: .retryFailed, progress: { (i, j) in
                    
                }, completed: { (image, error, type, url) in
                    if let image = image {
                        imageView.image = image
                    }
                })
            }
            
            imageView.backgroundColor = UIColor.randomColor
            self.scrollView.addSubview(imageView)
            
        }
        
        self.scrollView.contentSize = CGSize(width: width * CGFloat(self.itemDetails!.arrayImageURL.count), height: height)
    }
    func moveToNextPage() {
        let pageWidth:CGFloat = width
        let maxWidth:CGFloat = pageWidth * CGFloat(self.itemDetails!.arrayImageURL.count)
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        let pageNumber = round(scrollView.contentOffset.x / width)
        pageControl.currentPage = Int(pageNumber)
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        self.scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
    }
    

    @IBAction func btnYoutubeAction(_ sender: UIBarButtonItem)
    {
        
    }
    @IBAction func btnTagAction(_ sender: UIButton)
    {
        
    }
    @IBAction func btnShareAction(_ sender: UIButton)
    {
        
    }
    @IBAction func btnLikeAction(_ sender: UIButton)
    {
        
    }
    @IBAction func btnFavouriteAction(_ sender: UIButton)
    {
        
    }
    @IBAction func btnMoreAction(_ sender: UIButton) {
        if sender.tag == 0 {
            sender.tag = 1
            self.viewTop.isHidden = true
            self.viewReviewRating.isHidden = true
            self.viewMore.isHidden = false
            sender.setTitle("CLOSE", for: .normal)
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.hidesBackButton = true
        }else {
            sender.tag = 0
            self.viewTop.isHidden = false
            self.viewReviewRating.isHidden = false
            self.viewMore.isHidden = true
            sender.setTitle("MORE", for: .normal)
            self.navigationItem.hidesBackButton = true
            self.showLeftBarButtonItemWithImage()
        }
    }
    @IBAction func btnCreateAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "DetailsItemStoryboard", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "FrameSizeListViewController") as! FrameSizeListViewController
        //mainViewController.arrayCreationDetail = (self.itemDetails?.arrayCreationDetails)!
        mainViewController.modalPresentationStyle = .overCurrentContext
        self.present(mainViewController, animated: true) {
        }
    }
    @IBAction func tapGestureSubmitYourReviewAction(_ sender: UITapGestureRecognizer) {
        
        let storyboard = UIStoryboard(name: "LeftNavigationStoryboard", bundle: nil)
        
        let reviewAndRatingsContainerViewController = storyboard.instantiateViewController(withIdentifier: "ReviewAndRatingsContainerViewController") as! ReviewAndRatingsContainerViewController
        reviewAndRatingsContainerViewController.isMenu = false
        reviewAndRatingsContainerViewController.itemId = self.itemId ?? ""
        
        self.navigationController?.pushViewController(reviewAndRatingsContainerViewController, animated: true)
        
    }
    
    func getItemDetails() {
        let dicParams : [String : Any] = ["hash_key" : "", "item_id" : self.itemId!]
        
        RequestManager().getItem(parameters: dicParams, loader: true) { (status, responseModel, error) in
            if status {
                print("Data: \(responseModel ?? [:])")
                
                if let responseData = responseModel {
                    if let itemInfo = ItemInfo(serverData: responseData) {
                        self.itemDetails = itemInfo
                        self.setUpScrollView()
                        if self.timer == nil{
                            self.timer = Timer.scheduledTimer(timeInterval: self.TimerInterval, target: self, selector: #selector(self.moveToNextPage), userInfo: nil, repeats: true)
                        }
                    }
                }
            }else {
                print("Error: \(error?.localizedDescription as Any)")
            }
        }
    }
}


//MARK: - UIScrollViewDelegate

extension DetailsItemHomeViewController: UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}

