//
//  Table.swift
//  sahal
//
//  Created by Fatima Aljaber on 21/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit

class Table: UITableView {

    var maxHeight: CGFloat = UIScreen.main.bounds.size.height
    
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        //  self.frame.size.height = self.contentSize.height
        self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
        let height = min(contentSize.height, maxHeight)
        // print(maxHeight+contentSize.height)
        //   print("\(CGSize(width: contentSize.width, height: height))")
        return CGSize(width: contentSize.width, height: height)
    }
    
    
}
