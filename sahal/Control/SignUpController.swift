//
//  SignUpController.swift
//  sahal
//
//  Created by Ghufran nour  on 03/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class SignUpController: UIViewController {

    @IBOutlet weak var container: UIView!
 
    
    var SellerSignUpView : SignUpSeller!
    var buyerSignUpView : SignUpBuyer!
    
    var databaseRefrence: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         databaseRefrence = Database.database().reference()
        
        buyerSignUpView = Bundle.main.loadNibNamed("SignUpBuyer", owner: self, options: nil)?.first as! SignUpBuyer
        self.container.addSubview(buyerSignUpView)
        
        SellerSignUpView = Bundle.main.loadNibNamed("signUpSeller", owner: self, options: nil)?.first as! SignUpSeller
        self.container.addSubview(SellerSignUpView)
        self.container.bringSubview(toFront: SellerSignUpView)
        SellerSignUpView.signUpButton.addTarget(self, action: #selector(SignUpController.sellerSignUpButton(sender:)), for: .touchUpInside)
        
           /* SellerSignUpView.signUpButton.addTarget(self, action: #selector(SignUpController.sellerSignUpButton(sender:)), for: .touchUpInside) */
            
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func sellerSignUpButton(sender : UIButton)  {
        SVProgressHUD.show()
        let idValue = SellerSignUpView.mobile.text
        let companyValue = SellerSignUpView.companyName.text
        let phoneValue = SellerSignUpView.mobile.text
        
        guard let emailValue = SellerSignUpView.email.text , let passwordValue = SellerSignUpView.password.text else {
            return
        }
        Auth.auth().createUser(withEmail: emailValue, password: passwordValue ) {(result , error) in
            if  error == nil && result != nil {
                print("User is created ^_^")
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = companyValue
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("Display name changed")
                         self.performSegue(withIdentifier: "toSellerSiginUp", sender: self)
                    }
                    
                }
                
            } else {
                
                print("Error : \(error!)")
                
            }
            
            guard let uid = Auth.auth().currentUser?.uid else {
                return
            }
            
            let userDatabaserefrence = self.databaseRefrence.child("seller").child(uid)
            let value = ["bR" : idValue , "company":companyValue , "number": phoneValue]
            userDatabaserefrence.updateChildValues(value , withCompletionBlock : {(error , reference) in
                if error != nil {
                    print(error)
                }
            })
    
            
        }
    }
        
        

    
    
    @objc func buyerSignUpButton(sender : UIButton)  {
         SVProgressHUD.show()
        let usernameValue = buyerSignUpView.userName.text
        let phoneValue = buyerSignUpView.phonNumber.text
        
        guard let emailValue = buyerSignUpView.email.text , let passwordValue = buyerSignUpView.password.text else {
            return
        }
        Auth.auth().createUser(withEmail: emailValue, password: passwordValue ) {(result , error) in
            if  error == nil && result != nil {
                print("User is created ^_^")
                 let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = usernameValue
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("Display name changed")
                        self.performSegue(withIdentifier: "toBuyerSiginUp", sender: self)
                        
                    }
                    
                }
            } else {
                
                print("Error : \(error!)")
                
            }
            
            guard let uid =  Auth.auth().currentUser?.uid else {
                return
            }
            
            let userDatabaserefrence = self.databaseRefrence.child("buyer").child(uid)
            let value = ["name": usernameValue , "number":phoneValue]
            userDatabaserefrence.updateChildValues(value , withCompletionBlock : {(error , reference) in
                if error != nil {
                    print(error)
                }
            })
            
            
        }
        
    }
    
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
               self.container.bringSubview(toFront: SellerSignUpView)
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

