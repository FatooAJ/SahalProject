//
//  profileController.swift
//  sahal
//
//  Created by Ghufran nour  on 05/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit
import Firebase

class profileController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    

    @IBAction func handleLogout(_ sender: UIButton) {
            try! Auth.auth().signOut()
            print("logged Out")
        self.performSegue(withIdentifier: "logOut", sender: self)
        
    }
    
}
