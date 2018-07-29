//
//  passwordRecovery.swift
//  sahal
//
//  Created by Ghufran nour  on 16/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit
import Firebase

class passwordRecovery: UIViewController {
    
    
   
    
    @IBOutlet weak var userEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recovery(_ sender: Any) {
        let myEmail = "ghufran.nour@hotmail.com"
        guard let email = userEmail.text else {
            return
        }
        
    
        Auth.auth().fetchProviders(forEmail: email, completion: {
            (providers, error) in
            print(email)
            if providers == nil {
              //  print(error.localizedDescription)
                print("No email address matches ")
                let alert = UIAlertController(title: "عذرًا", message:"البريد الإلكتروني المستخدم غير صحيح", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "موافق", style: .default , handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                 print("ther's matches")
               
                Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                    if error == nil {
                        print("reset password email is sent")
                    }else {
                        print(error)
                    }
                }
            }
        })
        
        
        
    }
    
}
