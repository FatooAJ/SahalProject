//
//  ProfileBuyerViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 23/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit

class ProfileBuyerViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet var ImageProfile: UIImageView!
    @IBOutlet var DisplayName: UILabel!
    
    //TextFiled
    @IBOutlet var BuyerName: UITextField!
    @IBOutlet var Email: UITextField!
    @IBOutlet var Password: UITextField!
    @IBOutlet var Phone: UITextField!
    //label
    @IBOutlet var LabelBuyerName: UILabel!
    @IBOutlet var LabelEmail: UILabel!
    @IBOutlet var LabelPassword: UILabel!
    @IBOutlet var LabelPhone: UILabel!
    
    
    @IBOutlet var SaveButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Textfiled
        BuyerName.delegate = self
        BuyerName.isHidden = true
        Email.delegate = self
        Email.isHidden = true
        Password.delegate = self
        Password.isHidden = true
        Phone.delegate = self
        Phone.isHidden = true
        
        LabelBuyerName.isUserInteractionEnabled = true
        LabelEmail.isUserInteractionEnabled = true
        LabelPassword.isUserInteractionEnabled = true
        LabelPhone.isUserInteractionEnabled = true
        SaveButton.isHidden = true
//        let aSelector : Selector = "lblTapped"
//        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
//        tapGesture.numberOfTapsRequired = 1
//        LabelBuyerName.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
    }
    @IBAction func EditButton(_ sender: UIButton) {
        //Show LAbel
         LabelBuyerName.isHidden = true
         LabelEmail.isHidden = true
         LabelPassword.isHidden = true
         LabelPhone.isHidden = true
        //Hide Text Filed
         BuyerName.isHidden = false
         Email.isHidden = false
         Password.isHidden = false
         Phone.isHidden = false
        //Text equel Label
         BuyerName.text = LabelBuyerName.text
         Email.text = LabelEmail.text
         Password.text = LabelPassword.text
         Phone.text = LabelPhone.text
         SaveButton.isHidden = false
    }

    
//    func textFieldShouldReturn(userText: UITextField) -> Bool {
//        userText.resignFirstResponder()
//        textF.hidden = true
//        lbl.hidden = false
//        lbl.text = textF.text
//        return true
//    }

    @IBAction func Save(_ sender: UIButton) {
        //Show LAbel
        LabelBuyerName.isHidden = false
        LabelEmail.isHidden = false
        LabelPassword.isHidden = false
        LabelPhone.isHidden = false
        //Hide Text Filed
        BuyerName.isHidden = true
        Email.isHidden = true
        Password.isHidden = true
        Phone.isHidden = true
        //Text equel Label
        LabelBuyerName.text = BuyerName.text
        LabelEmail.text = Email.text
        LabelPassword.text = Password.text
        LabelPhone.text = Phone.text
        
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

}
