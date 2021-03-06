//
//  MyorderViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 22/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit
import SVProgressHUD

class MyorderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var productimg = ["1.jpeg","2.jpeg","3.jpg"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productimg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myordercell", for: indexPath) as! MyorderTableViewCell
      //  let title = titleOfproduct[indexPath.row]
        //  let productprice = Price[indexPath.row]
        // let Loctionicon = locationIcon[indexPath.row]
        let Productimg = productimg[indexPath.row]
        
   //     cell.titleproduct?.text = title
        
        //    cell.price?.text = productprice
        //    cell.locationicon?.image = UIImage(named: "location.png")
        //  cell.ShoppingIcon?.image = UIImage(named: "shopp")
        cell.productimg?.image = UIImage(named: Productimg)
        //        //Tabel cell Style
        //        cell.mainBackground.layer.cornerRadius = 10
        //        cell.mainBackground.layer.masksToBounds = true
        //        cell.shadowLayer.layer.masksToBounds = false
        //        cell.shadowLayer.layer.shadowOffset = CGSize(width: CGFloat(0), height: CGFloat(3))
        //        cell.mainBackground.layer.backgroundColor = UIColor.white.cgColor
        //        cell.shadowLayer.layer.shadowColor = UIColor.gray.cgColor
        //        cell.shadowLayer.layer.shadowOpacity = 0.30
        //        cell.shadowLayer.layer.shadowRadius = 10
        //        cell.shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: cell.shadowLayer.bounds, byRoundingCorners:.allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        //        cell.shadowLayer.layer.shouldRasterize = true
        //        cell.shadowLayer.layer.rasterizationScale = UIScreen.main.scale
        cell.selectionStyle = .none
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.shadowOpacity = 0.30
        
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.dismiss()
       
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    

}
