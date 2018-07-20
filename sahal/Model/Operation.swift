//
//  Operation.swift
//  sahal
//
//  Created by Ghufran nour  on 05/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import Foundation

class Operation  {
     var number : String!
     var date : String!
     var status : String!
    
    init(num:String , date : String  , status : String ) {
        
        self.number = num
        self.date = date
        self.status = status
    }
}
