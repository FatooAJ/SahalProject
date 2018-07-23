//
//  HomeViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 7/15/18.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var changesegment: UISegmentedControl!
    
    @IBOutlet var tableproduct: UITableView!
    @IBAction func ProductCatigorie(_ sender: UISegmentedControl){
        tableproduct.reloadData()
    }
    @IBAction func BuyIconButton(_ sender: Any) {
    }
    
    
    @IBOutlet var shadowLayer: UIView!
    @IBOutlet var mainBackground: UIView!
    var titleOfproduct = ["cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213"]
    var SellerName = ["Cars company","hope company", "Hassan company","Cars company","hope company", "Ahmed company","Cars company"]
    var cityname = ["Makkah","Jeddah","Madina","Dammam","Makkah","Jeddah","Madina"]
    var Price = ["300,0 SR","500,0SR","700,0SR","200,0SR","267,0SR","254,0SR","298,0SR"]
    //  var locationIcon = [""]
    //var shoppingIcon = [""]
    var productimg = ["1.jpeg","2.jpeg","3.jpg","4.jpg","5.jpg","3.jpg","4.jpg"]
    var productimg2 = ["3.jpg","3.jpg","3.jpg","3.jpg","3.jpg","3.jpg","3.jpg"]
    var productimg3 = ["4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg"]
    var productimg4 = ["5.jpg","5.jpg","5.jpg","5.jpg","5.jpg","3.jpg","4.jpg"]
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch changesegment.selectedSegmentIndex
        {
        case 0:
            return titleOfproduct.count
        case 1:
            return titleOfproduct.count
        case 2:
            return titleOfproduct.count
        case 3:
            return titleOfproduct.count
        default:
            break;
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productcell", for: indexPath) as! ProductTableViewCell
        let title = titleOfproduct[indexPath.row]
        let Sellername = SellerName[indexPath.row]
        let cityName = cityname[indexPath.row]
        let productprice = Price[indexPath.row]
        // let Loctionicon = locationIcon[indexPath.row]
        // let carticon = shoppingIcon[indexPath.row]
        
        switch changesegment.selectedSegmentIndex
        {
        case 0:
            // SHOWING THE HOME VIEW
            let Productimg = productimg[indexPath.row]
            //            cell.titleproduct?.text = title
            //            cell.sellername?.text = Sellername
            //            cell.city?.text = cityName
            // cell.price?.text = productprice
            //    cell.locationicon?.image = UIImage(named: "location.png")
            // cell.ShoppingIcon?.image = UIImage(named: "shopp")
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
            
            
        case 1:
            // SHOWING THE PROFILE VIEW
            let Productimg = productimg2[indexPath.row]
            //            cell.titleproduct?.text = title
            //            cell.sellername?.text = Sellername
            //            cell.city?.text = cityName
            //   cell.price?.text = productprice
            //    cell.locationicon?.image = UIImage(named: "location.png")
            //   cell.ShoppingIcon?.image = UIImage(named: "shopp")
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
            
        case 2:
            // SHOWING THE SETTINGS VIEW
            let Productimg = productimg3[indexPath.row]
            //            cell.titleproduct?.text = title
            //            cell.sellername?.text = Sellername
            //            cell.city?.text = cityName
            //   cell.price?.text = productprice
            //    cell.locationicon?.image = UIImage(named: "location.png")
            //   cell.ShoppingIcon?.image = UIImage(named: "shopp")
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
        case 3:
            let Productimg = productimg4[indexPath.row]
            //            cell.titleproduct?.text = title
            //            cell.sellername?.text = Sellername
            //            cell.city?.text = cityName
            //    cell.price?.text = productprice
            //    cell.locationicon?.image = UIImage(named: "location.png")
            //    cell.ShoppingIcon?.image = UIImage(named: "shopp")
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
        default:
            break;
        }
        
        
        
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
