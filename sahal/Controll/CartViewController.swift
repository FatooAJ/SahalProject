//
//  CartViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 21/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit

class CartViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {
    
    
    
    
    
    @IBOutlet var cartTable: UITableView!
    
    @IBAction func ConfirmOrderButton(_ sender: UIButton) {
       
    }
    @IBOutlet var TotalPrice: UILabel!
    
    @IBOutlet var EmptyCart: UIView!
    @IBOutlet var CartView: UIView!

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return Cart.sharedInstance.numberOfItemsInCart()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cartcell", for: indexPath) as! CartTableViewCell
        let productAdded = Cart.sharedInstance.productAtIndexPath(indexPath: indexPath as NSIndexPath)
        print(productAdded)
        cell.titleproduct?.text = productAdded.Title
        cell.sellername?.text = productAdded.sellerName
        cell.city?.text = "مكة المكرمة"
        cell.price?.text = productAdded.Price + "ريال"
        let url = productAdded.Img
        //print(url)
        cell.productimage?.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "noimage"))
        
        //        //Tabel cell Style
        cell.mainBackground.layer.cornerRadius = 10
        cell.mainBackground.layer.masksToBounds = true
        cell.shadowLayer.layer.masksToBounds = false
        cell.shadowLayer.layer.shadowOffset = CGSize(width: CGFloat(0), height: CGFloat(3))
        cell.mainBackground.layer.backgroundColor = UIColor.white.cgColor
        cell.shadowLayer.layer.shadowColor = UIColor.gray.cgColor
        cell.shadowLayer.layer.shadowOpacity = 0.30
        cell.shadowLayer.layer.shadowRadius = 10
        cell.shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: cell.shadowLayer.bounds, byRoundingCorners:.allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        cell.shadowLayer.layer.shouldRasterize = true
        cell.shadowLayer.layer.rasterizationScale = UIScreen.main.scale
        cell.selectionStyle = .none
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let product = Cart.sharedInstance.productAtIndexPath(indexPath: indexPath as NSIndexPath)
            let successful = Cart.sharedInstance.removeProduct(product: product.ProductId)
            print(product.ProductId)
            if successful == true {
                cartTable.beginUpdates()
                cartTable.deleteRows(at: [indexPath as IndexPath], with: .right)
                cartTable.endUpdates()
            }
            cartTable.reloadData()
            updatetotalprice()
            checkEmptyStateOfCart()
        }
    }

//    /// NumberFormatter to get the price of a product formatted right
//    lazy var productPriceFormatter: NumberFormatter = {
//        let productPriceFormatter = NSNumberFormatter()
//        productPriceFormatter.numberStyle = .CurrencyStyle
//        productPriceFormatter.locale = NSLocale.currentLocale()
//        return productPriceFormatter
//    }()
    func updatetotalprice(){
        TotalPrice.text = "\(Cart.sharedInstance.totalPriceInCart()) ريال"
        print("\(Cart.sharedInstance.totalPriceInCart()) ريال")
    }
    func checkEmptyStateOfCart() {
        setEmptyViewVisible(visible: Cart.sharedInstance.numberOfItemsInCart() == 0)
        
    }
    func setEmptyViewVisible(visible: Bool) {
        EmptyCart.isHidden = !visible
        if visible {
           // clearButton.enabled = false
            self.view.bringSubview(toFront: EmptyCart)
        } else {
           // clearButton.enabled = true
            self.view.sendSubview(toBack: EmptyCart)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkEmptyStateOfCart()
        updatetotalprice()
        cartTable.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
