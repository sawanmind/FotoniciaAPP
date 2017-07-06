//
//  OfferHeaderPagingTableViewCell.swift
//  AppWalkThrought
//
//  Created by Asheesh Verma on 12/10/16.
//  Copyright © 2016 G3nii. All rights reserved.
//

import UIKit
import SDWebImage

class OfferHeaderPagingTableViewCell: UITableViewCell {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!

    var indexPath:IndexPath?
    weak var delegate: ButtonActionProtocol?
    var timer:Timer?
    private let height = CGFloat(363)
    private let TimerInterval = 5.0
    var arraySliderModel: [SubCategory]? {
        didSet {
            self.setUpScrollView()
            if timer == nil{
             timer = Timer.scheduledTimer(timeInterval: TimerInterval, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    deinit {
        if let timer = self.timer{
            timer.invalidate()
        }
        
    }

    func setUpScrollView() {
        scrollView.frame = CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.size.width - 25),height: height)
        scrollView.delegate = self
        self.pageControl.numberOfPages = self.arraySliderModel!.count
        
        for i in 0..<arraySliderModel!.count{
            let xPosition = (UIScreen.main.bounds.size.width - 25) * CGFloat(i)
            
            let imageView = UIImageView()
            
            imageView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tappedScrollImage(sender:)))
            imageView.addGestureRecognizer(tapGesture)
            imageView.frame = CGRect(x: xPosition, y: 0, width: (UIScreen.main.bounds.size.width - 25), height: height)
            imageView.contentMode = .scaleToFill
            let model = arraySliderModel![i]
            if let url = model.imageURL, model.imageURL!.characters.count > 0 {
                imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named:Constant.PlaceHolderImage.Background), options: .retryFailed, progress: { (i, j) in
                    
                }, completed: { (image, error, type, url) in
                    if let image = image {
                        imageView.image = image
                    }
                })
            }
            
            imageView.backgroundColor = UIColor.randomColor
            self.scrollView.addSubview(imageView)
            
        }
        
        self.scrollView.contentSize = CGSize(width: (UIScreen.main.bounds.size.width - 25) * CGFloat(arraySliderModel!.count), height: height)
    }
    func moveToNextPage() {
        let pageWidth:CGFloat = (UIScreen.main.bounds.size.width - 25)
        let maxWidth:CGFloat = pageWidth * CGFloat(self.arraySliderModel!.count)
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        let pageNumber = round(scrollView.contentOffset.x / (UIScreen.main.bounds.size.width - 25))
        pageControl.currentPage = Int(pageNumber)
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        self.scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
    }
    func tappedScrollImage(sender:UITapGestureRecognizer) {
        if let del = self.delegate {
            del.didSelectCollectionView(indexPath: self.indexPath!, collectionIndexPath: nil)
        }
    }
    
}

extension OfferHeaderPagingTableViewCell: UIScrollViewDelegate{
    //MARK: - UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        
//        if Int(pageNumber) == self.arrayTitle.count-1{
//            self.btnSkip.hidden = true
//            self.btnNext.setTitle("GOT IT", forState: .Normal)
//        }else{
//            self.btnSkip.hidden = false
//            self.btnNext.setTitle("NEXT", forState: .Normal)
//        }
    }
}
