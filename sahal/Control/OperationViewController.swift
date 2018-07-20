//
//  OperationViewController.swift
//  sahal
//
//  Created by Ghufran nour  on 06/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit

class OperationViewController: UIViewController {
    
    @IBOutlet weak var container: UIView!
    var oldOperation : UIView!
    var newOperation : UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oldOperation = OldOperationViewController().view
        newOperation = NewOperationViewController().view
    }

    
    @IBAction func switchingSegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0 :
            container.bringSubview(toFront: oldOperation)
            break
        case 1 :
            container.bringSubview(toFront: newOperation)
            break
       
        
        default : break
        
         }
    }
}
