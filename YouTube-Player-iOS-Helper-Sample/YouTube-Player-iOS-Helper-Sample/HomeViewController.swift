//
//  HomeViewController.swift
//  YouTube-Player-iOS-Helper-Sample
//
//  Created by 宮崎数磨 on 2017/06/17.
//  Copyright © 2017年 Miyazaki Kazuma. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class HomeViewController: UIViewController ,YTPlayerViewDelegate{
    @IBOutlet weak var playerView: YTPlayerView!
    @IBOutlet weak var stateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self;
        self.playerView.load(withVideoId: "動画ID",playerVars:["playerinline":1])

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tapPlay(_ sender: Any) {
        self.playerView.playVideo()
    }
    @IBAction func tapPause(_ sender: Any) {
        self.playerView.pauseVideo()
    }
    @IBAction func tapStop(_ sender: Any) {
        self.playerView.stopVideo()
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        switch (state) {
        case YTPlayerState.unstarted:
            stateLabel.text = "停止中"
        case YTPlayerState.playing:
            stateLabel.text = "再生中"
        case YTPlayerState.paused:
            stateLabel.text = "一時停止中"
        case YTPlayerState.buffering:
            stateLabel.text = "バッファリング中"
        case YTPlayerState.ended:
            stateLabel.text = "再生終了"
        default:
            break
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
