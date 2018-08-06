//
//  Order.swift
//  sahal
//
//  Created by Ghufran nour  on 23/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import Foundation

class Order {
    
    var sellerId : String!
    var buyerId : String!
    var itemName : String!
    var date : String!
    var address : String!
    var ststus : String!
    
    init(sellerId : String! , buyerId : String!, itemName: String! , date : String!, address : String!, statues : String!){
        
        self.sellerId = sellerId
        self.buyerId = buyerId
        self.itemName = itemName
        self.date = date
        self.address = address
        self.ststus = statues
        
    }
    
    
    
}
