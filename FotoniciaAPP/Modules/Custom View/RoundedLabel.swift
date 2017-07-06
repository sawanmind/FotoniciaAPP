//
//  RoundedLabel.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 10/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class RoundedLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = 5.0
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = layer.frame.height / 2
        clipsToBounds = true
        self.backgroundColor = UIColor.white
    }

}
