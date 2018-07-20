//
//  SearchResultViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 20/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var titleOfproduct = ["cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213"]
    var SellerName = ["Cars company","hope company", "Joke company","Cars company","hope company", "Joke company","Cars company"]
    var cityname = ["Makkah","Jeddah","Madina","Riyad","Makkah","Jeddah","Madina"]
    var Price = ["2,00 SR","5000,00 SR","70000,00 SR","2,00 SR","2,00 SR","2,00 SR","200,00 SR"]
    //  var locationIcon = [""]
    //var shoppingIcon = [""]
    var productimg = ["1.jpeg","2.jpeg","3.jpg","4.jpg","5.jpg","3.jpg","4.jpg"]
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleOfproduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productcell", for: indexPath) as! ProductTableViewCell
        let title = titleOfproduct[indexPath.row]
        let Sellername = SellerName[indexPath.row]
        let cityName = cityname[indexPath.row]
        let productprice = Price[indexPath.row]
        // let Loctionicon = locationIcon[indexPath.row]
        // let carticon = shoppingIcon[indexPath.row]
        let Productimg = productimg[indexPath.row]
        
        cell.titleproduct?.text = title
        cell.sellername?.text = Sellername
        cell.city?.text = cityName
        cell.price?.text = productprice
        cell.locationicon?.image = UIImage(named: "location.png")
        cell.ShoppingIcon?.image = UIImage(named: "cart.png")
        cell.productimage?.image = UIImage(named: Productimg)
        
        //Tabel cell Style
        
        
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
