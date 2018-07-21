//
//  SignUpController.swift
//  sahal
//
//  Created by Ghufran nour  on 03/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var container: UIView!
 
    
    var SellerSignUpView : UIView!
    var buyerSignUpView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    SellerSignUpView = sellerSignUp().view
    buyerSignUpView = buyerSignUp().view
        
    container.addSubview(SellerSignUpView)
    container.addSubview(buyerSignUpView)
        
container.bringSubview(toFront: SellerSignUpView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            container.bringSubview(toFront: SellerSignUpView)
            break
        case 1 :
        container.bringSubview(toFront: buyerSignUpView)
           break
           

        default:
            break
        }
    }
    

}
