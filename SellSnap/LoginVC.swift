//
//  ViewController.swift
//  SellSnap
//
//  Created by Gurkan Yilmaz on 12/08/2017.
//  Copyright © 2017 Gurkan Yilmaz. All rights reserved.
//

import UIKit
import SwiftVideoBackground


class LoginVC: UIViewController {

    @IBOutlet weak var backgroundVideo: BackgroundVideo!
    
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var googleButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var briefLabel: UILabel!
    @IBOutlet var uiGesture: UISwipeGestureRecognizer!
    
    var textContentArray = ["Buy Buy Buy", "Some other stuffs, more other stuffs", "Stuff to Buy and Enjoy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()

        prepareBackgroundVideo()
        
        let leftswap = UISwipeGestureRecognizer(target: self, action: #selector(LoginVC.handleSwap(_:)))
        let rightswap = UISwipeGestureRecognizer(target: self, action: #selector(LoginVC.handleSwap(_:)))
        
        leftswap.direction = .left
        rightswap.direction = .right
        view.addGestureRecognizer(leftswap)
        view.addGestureRecognizer(rightswap)

    }
    
    func handleSwap(_ sender: UITapGestureRecognizer){
        if pageControl.currentPage != 3 {
            pageControl.currentPage += 1
            briefLabel.text = textContentArray[pageControl.currentPage]
        }
        else {
            pageControl.currentPage -= 1
            briefLabel.text = textContentArray[pageControl.currentPage]
        
        }
    }
    
    func prepareUI(){
        facebookButton.layer.cornerRadius = facebookButton.frame.height / 2
        googleButton.layer.cornerRadius = googleButton.frame.height / 2
        
    }
    
    func prepareBackgroundVideo(){
        
        let videoFileName = "B"
        if let videoFilePath = Bundle.main.path(forResource: videoFileName, ofType: "mp4") {
            print(videoFilePath)
            backgroundVideo!.createBackgroundVideo(name: videoFileName, type: "mp4", alpha: 0.3 )
        }
        else {
            print("Video not found")
        }
    
    }
    override var prefersStatusBarHidden : Bool {
        return true
    }

}

