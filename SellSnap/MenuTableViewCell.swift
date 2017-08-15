//
//  MenuTableViewCell.swift
//  SellSnap
//
//  Created by Gurkan Yilmaz on 15/08/2017.
//  Copyright © 2017 Gurkan Yilmaz. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    @IBOutlet var prodImage: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productDesc: UILabel!
    @IBOutlet var priceTag: UILabel!
    @IBOutlet var locName: UILabel!
    @IBOutlet var locIcon: UIButton!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.prodImage = UIImageView()
        self.productName = UILabel()
        self.productDesc = UILabel()
        self.priceTag = UILabel()
        self.locName = UILabel()
        self.locIcon = UIButton()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
