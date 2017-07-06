//
//  FrameSizeListViewController.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 08/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class FrameSizeListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var collectionViewAspectRation: UICollectionView!

    @IBOutlet weak var collectionView: UICollectionView!
    var arrayCreationDetail = [CreationDetail]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.isOpaque = false
        view.backgroundColor = UIColor.clear
        
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8)
        let width = UIScreen.main.bounds.size.width - 32
        flow.itemSize = CGSize(width: width / 2, height: 40.0)
        flow.minimumInteritemSpacing = 8
        flow.minimumLineSpacing = 8
        
        
//        // Set up the flow layout's cell alignment:
//        let layout = AlignedCollectionViewFlowLayout()
//        layout.horizontalAlignment = .justified
//        
//        // Enable automatic cell-sizing with Auto Layout:
//        layout.estimatedItemSize = CGSize(width: 100, height: 40)
//        layout.itemSize = CGSize(width: 100, height: 40)
//        
//        layout.scrollDirection = .horizontal //.horizontal
//        
//        layout.sectionInset = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 20)
//                layout.minimumLineSpacing = 20.0
//        layout.minimumInteritemSpacing = 10.0
//        collectionView.setCollectionViewLayout(layout, animated: true)
        
        self.collectionView.register(UINib(nibName: "FrameSizeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FrameSizeCollectionViewCell")
        self.collectionView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var tapGestureAction: UITapGestureRecognizer!
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true) {
        }
    }
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayCreationDetail.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameSizeCollectionViewCell", for: indexPath as IndexPath) as! FrameSizeCollectionViewCell
        
        cell.lblTitle.text = self.arrayCreationDetail[indexPath.item].frameSizeAndPrice
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        self.dismiss(animated: true) {
        }
    }
    
    // change background color when user touches cell
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.backgroundColor = UIColor.red
//    }
//    
//    // change background color back when user releases touch
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.backgroundColor = UIColor.cyan
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width / 3 - 32, height: 40)
//    }
}
