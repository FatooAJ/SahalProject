//
//  sellerHomeController.swift
//  sahal
//
//  Created by Ghufran nour  on 05/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit

class sellerHomeController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var productArray:[Product] = []
    
    func creatProductArray() -> [Product] {
        
        var tempArray : [Product] = []
        
        let product1 = Product(img: "1.jpeg", title: "عكس أمامي أزيرا ", description: "حالة المنتج : متاح ")
        let product2 = Product(img: "2.jpeg", title: "عكس أمامي أزيرا ", description: " المنتج : متاح ")
        let product3 = Product(img: "3.jpg", title: "عكس أمامي أزيرا", description: " المنتج : متاح ")
          let product4 = Product(img: "3.jpg", title: "عكس أمامي أزيرا", description: " المنتج : متاح ")
        
        
        
        tempArray.append( product1)
        tempArray.append( product2)
        tempArray.append(product3)
      //  tempArray.append(product4)
        
        return tempArray
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let product = productArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! productCell
        
        cell.mainBackground.layer.cornerRadius = 10
        cell.mainBackground.layer.masksToBounds = true
        
        cell.shadowBackground.layer.masksToBounds = false
        cell.shadowBackground.layer.shadowOffset = CGSize(width: CGFloat(0), height: CGFloat(3))
        cell.shadowBackground.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.shadowBackground.layer.shadowOpacity = 0.23
        cell.shadowBackground.layer.shadowRadius = 17
        cell.shadowBackground.layer.shadowPath = UIBezierPath(roundedRect: cell.shadowBackground.bounds, byRoundingCorners: .allCorners , cornerRadii: CGSize(width: 8, height: 8)).cgPath
        
        cell.shadowBackground.layer.shouldRasterize = true
        cell.shadowBackground.layer.rasterizationScale = UIScreen.main.scale
        cell.selectionStyle = .none
       
        
        cell.setProduct(product: product )
    
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        productArray = creatProductArray()
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
