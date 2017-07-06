//
//  YoutubeViewController.swift
//  FotoniciaAPP
//
//  Created by Asheesh Verma on 08/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class YoutubeViewController: UIViewController {
    //@IBOutlet weak var playerYoutube: YTPlayerView!

    var videoId:String?
    let playParam = [
        // not full screen
        "playsinline": 1
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*if let id = self.videoId {
            let myURL = URL(string: "https://www.youtube.com/embed/oCm_lnoVf08")!
            self.playerYoutube.load(withVideoId: "qUvPzjSWMSM", playerVars: playParam)
        }else {
            let myURL = URL(string: "https://www.youtube.com/embed/oCm_lnoVf08")!
            self.playerYoutube.load(withVideoId: "qUvPzjSWMSM", playerVars: playParam)
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnCloseAction(_ sender: UIButton) {
        self.dismiss(animated: true) { 
        }
    }
}
/*
extension YoutubeViewController: YTPlayerViewDelegate {
    
}*/
