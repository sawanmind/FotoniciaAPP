//
//  ButtonActionProtocol.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 04/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import Foundation

protocol ButtonActionProtocol: class {
    func didSelectCollectionView(indexPath:IndexPath, collectionIndexPath:IndexPath?)
}

protocol SubCategoryDelegate {
    func subCategorySelected(subCategory: SubCategory)
}
