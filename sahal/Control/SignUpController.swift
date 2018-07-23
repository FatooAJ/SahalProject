//
//  SignUpController.swift
//  sahal
//
//  Created by Ghufran nour  on 03/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit
import Firebase

class SignUpController: UIViewController {

    @IBOutlet weak var container: UIView!
 
    
    var SellerSignUpView : SignUpSeller!
    var buyerSignUpView : SignUpBuyer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        buyerSignUpView = Bundle.main.loadNibNamed("SignUpBuyer", owner: self, options: nil)?.first as! SignUpBuyer
        self.container.addSubview(buyerSignUpView)
        
        SellerSignUpView = Bundle.main.loadNibNamed("signUpSeller", owner: self, options: nil)?.first as! SignUpSeller
        self.container.addSubview(SellerSignUpView)
        self.container.bringSubview(toFront: SellerSignUpView)
        
           /* SellerSignUpView.signUpButton.addTarget(self, action: #selector(SignUpController.sellerSignUpButton(sender:)), for: .touchUpInside) */
            
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func sellerSignUpButton(sender : UIButton)  {
        print("Active Button")
        
        
        guard let emailValue = SellerSignUpView.email.text , let passwordValue = SellerSignUpView.password.text else {
            return
        }
        print("\(passwordValue)")
        Auth.auth().createUser(withEmail: emailValue, password: passwordValue ) {(user , error) in
            if  error == nil && user != nil {
                print("User is created ^_____^")
            } else {
                
                print("Error : \(error!)")
                
            }
        }
        
        
    }
    
    
    @objc func buyerSignUpButton(sender : UIButton)  {
        print("Active Button")
        
        
        guard let emailValue = buyerSignUpView.email.text , let passwordValue = buyerSignUpView.password.text else {
            return
        }
        print("\(passwordValue)")
        Auth.auth().createUser(withEmail: emailValue, password: passwordValue ) {(user , error) in
            if  error == nil && user != nil {
                print("User is created ^_____^")
            } else {
                
                print("Error : \(error!)")
                
            }
        }
        
        
    }
    
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
                SellerSignUpView.signUpButton.addTarget(self, action: #selector(SignUpController.sellerSignUpButton(sender:)), for: .touchUpInside)
                
            print("first segment")
            break
        case 1 :
             self.container.bringSubview(toFront: buyerSignUpView)
            buyerSignUpView.signUpButton.addTarget(self, action: #selector(SignUpController.buyerSignUpButton(sender:)), for: .touchUpInside)
            
        print("Second segment")
           break
           

        default:
            break
        }
    }
    

}
