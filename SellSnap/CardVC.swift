//
//  CardVC.swift
//  SellSnap
//
//  Created by Gurkan Yilmaz on 14/08/2017.
//  Copyright © 2017 Gurkan Yilmaz. All rights reserved.
//

import UIKit

class CardVC: UITableViewController {
    var products : [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell",
                                                 for: indexPath) as! MenuTableViewCell
        
        cell.locName.text = "Kanyon AVM"
        cell.priceTag.text = "65 ₺"
        cell.prodImage.image = UIImage(named: "yourLossBabe")
        cell.productDesc.text = "Your Loss T-Shirt"
        cell.productName.text = "Armani Jeans"

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ProductDetails") as! ProductDetailsVC
        self.present(newViewController, animated: true, completion: nil)
        
    }

}
