
//
//  OperationModel.swift
//  sahal
//
//  Created by Ghufran nour  on 08/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import Foundation

class OperationModel {
    var headerTitle : String?
    var subType : [String]
    var isExbanable : Bool = true
    
    init(headerTitle : String , subType : [String] , isExbanable : Bool) {
        self.headerTitle = headerTitle
        self.subType = subType
        self.isExbanable = isExbanable
    }
}
