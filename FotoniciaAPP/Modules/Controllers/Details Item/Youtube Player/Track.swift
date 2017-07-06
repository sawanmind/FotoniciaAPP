//
//  Track.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 10/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class Track: NSObject {
    var title: String
    var imageUrl: String
    var videoUrl: String
    
    init(title: String, imageUrl: String, videoUrl: String) {
        self.title = title
        self.imageUrl = imageUrl
        self.videoUrl = videoUrl
    }
}
