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
        
        let product1 = Product(img: "productImage", title: "product 1 ", description: "DEscription 1 ")
        let product2 = Product(img: "productImage", title: "product 1 ", description: "DEscription 1 ")
        let product3 = Product(img: "productImage", title: "product 1 ", description: "DEscription 1 ")
     
     
        
        tempArray.append( product1)
        tempArray.append( product2)
        tempArray.append(product3)
        
        return tempArray
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let product = productArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! productCell
        cell.setProduct(product: product )
    
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        productArray = creatProductArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
