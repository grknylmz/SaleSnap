//
//  Product.swift
//  SellSnap
//
//  Created by Gurkan Yilmaz on 15/08/2017.
//  Copyright © 2017 Gurkan Yilmaz. All rights reserved.
//

import Foundation
import CoreLocation

class Product {
    var _image : String?
    var _discountRate : Int?
    var _storeCoordinate : CLLocationCoordinate2D?
    
    
    init(image : String , discountRate : Int , storeCoordinate : CLLocationCoordinate2D ){
        _image = image
        _discountRate = discountRate
        _storeCoordinate = storeCoordinate
    }

}
