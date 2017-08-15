//
//  ProductDetailsVC.swift
//  SellSnap
//
//  Created by Gurkan Yilmaz on 15/08/2017.
//  Copyright © 2017 Gurkan Yilmaz. All rights reserved.
//

import UIKit
import ImageSlideshow

class ProductDetailsVC: UITableViewController {

    @IBOutlet var imageSlideShow: ImageSlideshow!
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSlideShow()

        
    }
    
    func prepareSlideShow(){
        imageSlideShow.setImageInputs([
            ImageSource(image: UIImage(named: "yourLossBabe")!),
            ImageSource(image: UIImage(named: "shirt")!) ])
        
        imageSlideShow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProductDetailsVC.didTap))
        imageSlideShow.addGestureRecognizer(gestureRecognizer)
        
        imageSlideShow.contentScaleMode = .top
        
    
    }
    
    func didTap() {
        imageSlideShow.presentFullScreenController(from: self)
    }
    


}
