//
//  editeProduct.swift
//  sahal
//
//  Created by Ghufran nour  on 19/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit

class editeProduct: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    
    var titleString : String!
    var id : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLable.text = " id :\(self.id ) \n item name :\(titleString)"

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

  
}
