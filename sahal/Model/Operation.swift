//
//  Operation.swift
//  sahal
//
//  Created by Ghufran nour  on 05/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import Foundation


class Operation {
    var sellerId : String!
    var buyerId : String!
    var itemName : String!
    var address : String!
    var status : String!
    var buyerMobile : String!
    var buyerName : String!
    var img : String!
    var itemId : String!

    init(itemid:String! ,sellerId : String! , buyerId : String!, itemName: String! , address : String!, statues : String! , mobile : String! , buyerName : String! , img : String! ){
        self.itemId = itemid
    self.sellerId = sellerId
    self.buyerId = buyerId
    self.itemName = itemName
    self.address = address
    self.status = statues
    self.buyerMobile = mobile
    self.buyerName = buyerName
    self.img = img
    
}
    
    init(num:String , date : String  , status : String ) {
        
        self.itemName = num
        self.status = status
    }
}
