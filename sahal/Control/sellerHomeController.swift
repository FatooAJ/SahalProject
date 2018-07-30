//
//  sellerHomeController.swift
//  sahal
//
//  Created by Ghufran nour  on 05/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import SDWebImage

class sellerHomeController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var productArray:[Product] = []
    var ref : DatabaseReference!
    var refHandle : UInt!
    var cell : productCell!
    var product = [Product]()
    var dataDict : [String : AnyObject]!
    var productTiltle : String!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sellerID = Auth.auth().currentUser?.uid
        
      
        // let product = productArray[indexPath.row]
        self.cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! productCell
        
        self.cell.mainBackground.layer.cornerRadius = 10
        self.cell.mainBackground.layer.masksToBounds = true
        
        self.cell.shadowBackground.layer.masksToBounds = false
        self.cell.shadowBackground.layer.shadowOffset = CGSize(width: CGFloat(0), height: CGFloat(3))
        self.cell.shadowBackground.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.cell.shadowBackground.layer.shadowOpacity = 0.23
        self.cell.shadowBackground.layer.shadowRadius = 17
        self.cell.shadowBackground.layer.shadowPath = UIBezierPath(roundedRect: cell.shadowBackground.bounds, byRoundingCorners: .allCorners , cornerRadii: CGSize(width: 8, height: 8)).cgPath
        
        self.cell.shadowBackground.layer.shouldRasterize = true
        self.cell.shadowBackground.layer.rasterizationScale = UIScreen.main.scale
        self.cell.selectionStyle = .none
       
       // let tittle = product.producttitle!
       // let status = product.status!
        
        
       self.cell.productTitle.text = "Car name"
        self.cell.productDescription.text = "Statues"
       // cell.setProduct(product: product )
    
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
         ref = Database.database().reference()
        
        //productArray = creatProductArray()
        tableView.tableFooterView = UIView()
        SVProgressHUD.dismiss()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func fetchSellerProduct() {
        self.ref.child("items").observe(.childAdded) { (snapshots:DataSnapshot) in
            if let dectionary = snapshots.value as? [String:AnyObject] {
                let img = snapshots.childSnapshot(forPath: "itemImages")
                let item = Product(dectionary: dectionary, productID: snapshots.key)
                for count in 0...3 {
                   
                    let image = img.childSnapshot(forPath: "\(count)").value as? String
                    item.imgproduct.append(image!)
                }
                self.product.append(item)
            }
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
