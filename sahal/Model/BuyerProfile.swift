//
//  BuyerProfile.swift
//  sahal
//
//  Created by Fatima Aljaber on 23/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import Foundation

class BuyerProfile {
    var DisplayName : String?
    var BuyerName : String?
    var Email : String?
    var BuyerPassword : String?
    var BuyerPhone : String?
    
    init(DisplayName : String ,BuyerName : String , Email : String , BuyerPassword : String , BuyerPhone : String ) {
        self.DisplayName = DisplayName
        self.BuyerName = BuyerName
        self.Email = Email
        self.BuyerPassword = BuyerPassword
        self.BuyerPhone = BuyerPhone
   
    }
}
