//
//  CartViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 21/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit

class CartViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {
    
    
    @IBAction func ConfirmOrderButton(_ sender: UIButton) {
    }
    @IBOutlet var TotalPrice: UILabel!
    
    @IBAction func DeleteButton(_ sender: UIButton) {
    }
    
    var titleOfproduct = ["cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213"]
    var SellerName = ["Cars company","hope company"]
    var cityname = ["Makkah","Jeddah"]
    var Price = ["287,00 SR","500,00SR"]
    //  var locationIcon = [""]
    //var shoppingIcon = [""]
    var productimg = ["1.jpeg","2.jpeg"]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productimg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cartcell", for: indexPath) as! CartTableViewCell
        let title = titleOfproduct[indexPath.row]
        let Sellername = SellerName[indexPath.row]
        let cityName = cityname[indexPath.row]
        let productprice = Price[indexPath.row]
        // let Loctionicon = locationIcon[indexPath.row]
        let Productimg = productimg[indexPath.row]
        
        //        cell.titleproduct?.text = title
        //        cell.sellername?.text = Sellername
        //        cell.city?.text = cityName
        //        cell.price?.text = productprice
        //    cell.locationicon?.image = UIImage(named: "location.png")
        //  cell.ShoppingIcon?.image = UIImage(named: "shopp")
        cell.productimage?.image = UIImage(named: Productimg)
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
