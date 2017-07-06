//
//  TestFlowLayout.swift
//  FotoniciaAPP
//
//  Created by shadman Alam on 24/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class TestFlowLayout: UICollectionViewFlowLayout {
    
    fileprivate var paginatedScroll: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        // If the UICollectionView has paginatedScroll set to false there is no
        // need to apply any pagination logic, we will return the current
        // proposedContentOffset coordinates.
        guard paginatedScroll == true else {
            return CGPoint(x: proposedContentOffset.x, y: 0)
        }

    
        guard let collectionView: UICollectionView = collectionView else {
            return CGPoint(x: proposedContentOffset.x, y: 0)
        }
        let scannerFrame: CGRect = CGRect(x: proposedContentOffset.x,
                                          y: 0,
                                          width: collectionView.bounds.width,
                                          height: collectionView.bounds.height)
        guard let layoutAttributes: [UICollectionViewLayoutAttributes] = super.layoutAttributesForElements(in: scannerFrame) else {
            return CGPoint(x: proposedContentOffset.x, y: 0)
        }

        let collectionViewInsets: CGFloat = 10.0
        let proposedXCoordWithInsets: CGFloat = proposedContentOffset.x + collectionViewInsets
        var offsetCorrection: CGFloat = .greatestFiniteMagnitude
        
        layoutAttributes.filter { layoutAttribute -> Bool in
            
            layoutAttribute.representedElementCategory == .cell
            }.forEach { cellLayoutAttribute in

                let discardableScrollingElementsFrame: CGFloat = collectionView.contentOffset.x + (collectionView.frame.size.width / 2)
                
                if (cellLayoutAttribute.center.x <= discardableScrollingElementsFrame && velocity.x > 0) || (cellLayoutAttribute.center.x >= discardableScrollingElementsFrame && velocity.x < 0) {
                    return
                }
                
                if abs(cellLayoutAttribute.frame.origin.x - proposedXCoordWithInsets) < abs(offsetCorrection) {
                    offsetCorrection = cellLayoutAttribute.frame.origin.x - proposedXCoordWithInsets
                }
        }
        
        return CGPoint(x: proposedContentOffset.x + offsetCorrection, y: 0)
    }
}

class TestCollectionView: UICollectionView {
    /// The inner-`indexPath` of the GLIndexedCollectionView.
    ///
    /// Use it to discriminate between all the possible GLIndexedCollectionViews
    /// inside `UICollectionView`'s `dataSource` and `delegate` methods.
    ///
    /// This should be set and updated only through GLCollectionTableViewCell's
    /// `setCollectionViewDataSourceDelegate` func to avoid strange behaviors.
    var indexPath: IndexPath!
}

class TestTableViewCell: UITableViewCell {
    /// The `UICollectionView`-inside-a-`UITableViewCell` itself.
    ///
    /// Keep the variable `public` so it would be easier to access later in the
    /// code, for example in UITableView's `dataSource` and
    /// `delegate` methods.
    ///
    /// GLIndexedCollectionView requires a `strong` ARC reference, do not assign
    /// a `weak` reference to it otherwise it could be released unexpectedly,
    /// causing a crash.
    var collectionView: TestCollectionView!
    var collectionFlowLayout: TestFlowLayout!
    
    /// A Boolean value that controls whether the `UICollectionViewFlowLayout`
    /// of the GLIndexedCollectionView will paginate scroll or not.
    ///
    /// Set [true]() to make the UICollectionView paginate scroll based on it's
    /// `itemSize`, set to [false]() for regular scrolling. The
    /// `UICollectionViewFlowLayout` will deduct the right scrolling offset
    /// values automatically so you should not set the `itemSize` value
    /// directly.
    ///
    /// Default value is `nil`, since `Bool` is `Optional`.
    var collectionViewPaginatedScroll: Bool?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionFlowLayout = TestFlowLayout()
        collectionFlowLayout.scrollDirection = .horizontal
        
        collectionView = TestCollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        collectionView.register(UINib(nibName: "TestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TestCollectionViewCell.identifier)
        collectionView.backgroundColor = .gray
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.bounces = true
        collectionView.isDirectionalLockEnabled = true
        collectionView.isMultipleTouchEnabled = false
        collectionView.isOpaque = true
        
        contentView.addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override final func layoutSubviews() {
        super.layoutSubviews()
        
        
        collectionFlowLayout.paginatedScroll = collectionViewPaginatedScroll
        
        if collectionViewPaginatedScroll == true {
            collectionView.isPagingEnabled = false
        }
        
        guard collectionView.frame != contentView.bounds else {
            return
        }
        
        collectionView.frame = contentView.bounds
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
  
    final func setCollectionView(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate, indexPath: IndexPath) {
        collectionView.indexPath = indexPath
        
        if collectionView.dataSource == nil {
            collectionView.dataSource = dataSource
        }
        
        if collectionView.delegate == nil {
            collectionView.delegate = delegate
        }
        
        collectionView.reloadData()
    }
}


