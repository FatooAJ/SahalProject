//
//  SellerProfile.swift
//  sahal
//
//  Created by Fatima Aljaber on 27/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import Foundation

class SellerProfile {
    var DisplayName : String?
    var SellerName : String?
    var Email : String?
    var SellerPassword : String?
    var SellerPhone : String?
    
    init(DisplayName : String ,SellerName : String , Email : String , SellerPassword : String , SellerPhone : String ) {
        self.DisplayName = DisplayName
        self.SellerName = SellerName
        self.Email = Email
        self.SellerPassword = SellerPassword
        self.SellerPhone = SellerPhone
        
    }
}
