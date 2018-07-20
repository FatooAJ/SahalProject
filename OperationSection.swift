//
//  OperationSection.swift
//  
//
//  Created by Ghufran nour  on 06/11/1439 AH.
//

import Foundation

struct Section {
    
    var genre : String!
    var operationList : [String]!
    var expanded : Bool
    
    init(genre : String , OperationSection : [String] , expanded : Bool ) {
        self.genre = genre
        self.OperationSection = OperationSection
        self.expanded = expanded
    }
}
