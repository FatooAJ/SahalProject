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
    var SellerName = ["Cars company","hope company", "Joke company","Cars company","hope company", "Joke company","Cars company"]
    var cityname = ["Makkah","Jeddah","Madina","Riyad","Makkah","Jeddah","Madina"]
    var Price = ["2,00 SR","500,00SR","700,00SR","2,00SR","2,00SR","2,00SR","200,00SR"]
    //  var locationIcon = [""]
    //var shoppingIcon = [""]
    var productimg = ["1.jpeg","2.jpeg","3.jpg","4.jpg","5.jpg","3.jpg","4.jpg"]
    
    
    
    
    
    
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
        let Productimg = productimg[indexPath.row]
        switch changesegment.selectedSegmentIndex
        {
        case 0:
            // SHOWING THE HOME VIEW
            
            cell.titleproduct?.text = title
            cell.sellername?.text = Sellername
            cell.city?.text = cityName
            cell.price?.text = productprice
            //    cell.locationicon?.image = UIImage(named: "location.png")
            cell.ShoppingIcon?.image = UIImage(named: "shopp")
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
            
            cell.titleproduct?.text = title
            cell.sellername?.text = Sellername
            cell.city?.text = cityName
            cell.price?.text = productprice
            //    cell.locationicon?.image = UIImage(named: "location.png")
            cell.ShoppingIcon?.image = UIImage(named: "shopp")
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
            
            cell.titleproduct?.text = title
            cell.sellername?.text = Sellername
            cell.city?.text = cityName
            cell.price?.text = productprice
            //    cell.locationicon?.image = UIImage(named: "location.png")
            cell.ShoppingIcon?.image = UIImage(named: "shopp")
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
            
            cell.titleproduct?.text = title
            cell.sellername?.text = Sellername
            cell.city?.text = cityName
            cell.price?.text = productprice
            //    cell.locationicon?.image = UIImage(named: "location.png")
            cell.ShoppingIcon?.image = UIImage(named: "shopp")
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
