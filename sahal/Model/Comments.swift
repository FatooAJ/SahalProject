//
//  Comments.swift
//  sahal
//
//  Created by Fatima Aljaber on 28/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import Foundation

class Comments{
    var SellerName : String?
    var BuyerName : String?
    var CommentsFromUser : String?
    var BuyerID : String?
    var SellerID : String?
    
    init (dectionary: [String: Any]) {
        self.BuyerID = dectionary["SenderID"] as? String
        self.BuyerName = dectionary["SenderName"] as? String
        self.CommentsFromUser = dectionary["Comments"] as? String
        
    }
    
}
