//
//  SearchResultViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 20/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    @IBOutlet var productcollection: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleOfproduct.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productcell", for: indexPath) as! SearchResultCollectionViewCell
        let title = titleOfproduct[indexPath.row]
        let Sellername = SellerName[indexPath.row]
        let cityName = cityname[indexPath.row]
        let productprice = Price[indexPath.row]
        // let Loctionicon = locationIcon[indexPath.row]
        // let carticon = shoppingIcon[indexPath.row]
        let Productimg = productimg[indexPath.row]
        
        //        cell.titleproduct?.text = title
        //        cell.sellername?.text = Sellername
        //        cell.city?.text = cityName
        //        cell.price?.text = productprice
        //   cell.locationicon?.image = UIImage(named: "location.png")
        //  cell.ShoppingIcon?.image = UIImage(named: "cart.png")
        cell.productimage?.image = UIImage(named: Productimg)
        cell.mainBackground.layer.cornerRadius = 10
        cell.mainBackground.layer.masksToBounds = true
        cell.shadowLayer.layer.masksToBounds = false
        cell.shadowLayer.layer.shadowOffset = CGSize(width: CGFloat(0), height: CGFloat(3))
        cell.mainBackground.layer.backgroundColor = UIColor.white.cgColor
        cell.shadowLayer.layer.shadowColor = UIColor.gray.cgColor
        cell.shadowLayer.layer.shadowOpacity = 0.10
        
        cell.shadowLayer.layer.shadowRadius = 10
        cell.shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: cell.shadowLayer.bounds, byRoundingCorners:.allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        cell.shadowLayer.layer.shouldRasterize = true
        cell.shadowLayer.layer.rasterizationScale = UIScreen.main.scale
        cell.mainBackground.layer.borderWidth = 0.50
        cell.mainBackground.layer.borderColor = UIColor.lightGray.cgColor
        
        // cell.layer.borderWidth = 2
        //cell.layer.rasterizationScale =
        //cell.selectionStyle = .none
        return cell
        
    }
    
    var titleOfproduct = ["cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213","cars category 312321 camere germani 3123213"]
    var SellerName = ["Cars company","hope company", "Hassan company","Cars company","hope company", "Ahmed company","Cars company"]
    var cityname = ["Makkah","Jeddah","Madina","Riyad","Makkah","Jeddah","Madina"]
    var Price = ["670,0 SR","500,0 SR","700,0 SR","290,0 SR","290,0 SR","220,0 SR","200,0 SR"]
    //  var locationIcon = [""]
    //var shoppingIcon = [""]
    var productimg = ["1.jpeg","2.jpeg","3.jpg","4.jpg","5.jpg","3.jpg","4.jpg"]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productcollection.dataSource = self
        productcollection.delegate = self
        var layout = self.productcollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing = 5
        //        layout.itemSize = CGSize(width: (self.productcollection.frame.size.width-20/2), height: self.productcollection.frame.size.height/3)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
