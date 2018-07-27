//
//  logIn.swift
//  sahal
//
//  Created by Ghufran nour  on 03/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit
import TextFieldEffects
import Firebase
import SVProgressHUD

class logIn: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    
    var databaseRefrence: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        databaseRefrence = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logInButton(_ sender: UIButton) {
        guard let emailValue = emailOutlet.text else { return }
        guard let passValue = passwordOutlet.text else { return }
        
        Auth.auth().signIn(withEmail: emailValue, password: passValue){ user , error in
            if error == nil && user != nil {
                 print("YAAAY!")
               let uID = Auth.auth().currentUser?.uid
                self.databaseRefrence.child("seller").observe(.childAdded) { (snapshot) in
                    print(snapshot.key)
                    
                    if snapshot.key == uID {
                        print("YAAAY!")
                        
                        self.performSegue(withIdentifier: "toSeller", sender: self)
                    }
                }
                
                
                self.databaseRefrence.child("buyer").observe(.childAdded) { (snapshot) in
                    print(snapshot.key)
                    
                    if snapshot.key == uID {
                        print("YAAAY!")
                        self.performSegue(withIdentifier: "toBuyer", sender: self)
                    }
                }
            }
            
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        databaseRefrence.child("seller").observe(.childAdded) { (snapshot) in
            print(snapshot.key)
            
            if snapshot.key == uID {
                print("YAAAY!")
                self.performSegue(withIdentifier: "toSeller", sender: self)
            }
        }
        
        databaseRefrence.child("buyer").observe(.childAdded) { (snapshot) in
            print(snapshot.key)
            
            if snapshot.key == uID {
                print("YAAAY!")
                self.performSegue(withIdentifier: "toBuyer", sender: self)
            }
        }
        }
    

}
