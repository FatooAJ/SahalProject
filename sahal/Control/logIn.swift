//
//  logIn.swift
//  sahal
//
//  Created by Ghufran nour  on 03/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit
import TextFieldEffects

class logIn: UIViewController {

    
    @IBOutlet weak internal var email: HoshiTextField!
    
    @IBOutlet weak var passWord: KaedeTextField?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backClicked(_ sender: UIBarButtonItem) {
        print("Hello")
        navigationController?.popToRootViewController(animated: true)

    }
    
}
