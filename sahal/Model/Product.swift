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
    // var SellerID
    
    
    init (dectionary: [String: Any]) {
        
        //  self.img = img
        self.producttitle = dectionary["name"] as? String
        self.productdescription = dectionary["description"] as? String
        self.Price = dectionary["price"] as? String
        self.City = dectionary["City"] as? String
        self.Companyname = dectionary["factoryName"] as? String
        self.Category = dectionary["category"] as? String
        self.status = dectionary["status"] as? String
        
    }
}
