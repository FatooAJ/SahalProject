//
//  product.swift
//  sahal
//
//  Created by Ghufran nour  on 05/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//
import Foundation
import UIKit

class Product {
    
    var img: String!
    var title : String!
    var description : String!
    
    init(img : String! ,title : String! , description : String! ) {
        self.img = img
        self.title = title
        self.description = description
    }
    
    var imgproduct = [String]()
    var producttitle : String!
    var productdescription : String!
    var Price : String!
    var City : String!
    var Companyname : String!
    var Category : String!
    var status : String!
    var productID : String!
    var year : String!
    var type : String!

    var carname : String!
    var SellerID : String!

    
    
    init (dectionary: [String: Any], productID : String) {
        
      //  self.imgproduct = storageRef
        self.productID = productID
        self.producttitle = dectionary["name"] as? String
        self.productdescription = dectionary["description"] as? String
        self.Price = dectionary["price"] as? String
        self.City = dectionary["city"] as? String
        self.Companyname = dectionary["factoryName"] as? String
        self.Category = dectionary["category"] as? String
        self.status = dectionary["status"] as? String
        self.year = dectionary["year"] as? String
        self.type = dectionary["type"] as? String
        self.carname = dectionary["carName"] as? String
        self.SellerID = dectionary["sellerId"] as? String
        self.imgproduct = []
    //    self.imgproduct = dectionary["images"] as? String
    
        
    }
    
    
    init () {
        
        //  self.imgproduct = storageRef
        self.productID = ""
        self.producttitle = ""
        self.productdescription = ""
        self.Price = ""
        self.City = ""
        self.Companyname = ""
        self.Category = ""
        self.status = ""
        self.year = ""
        self.type = ""

        
    }
    
//    func getCompany() -> String {
//        self.Companyname
//    }
}
