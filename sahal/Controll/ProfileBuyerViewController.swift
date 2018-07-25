//
//  ProfileBuyerViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 23/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class ProfileBuyerViewController: UIViewController , UITextFieldDelegate, UIImagePickerControllerDelegate , UINavigationControllerDelegate  {
    
    // Database
    var databaseReference : DatabaseReference!

    //TextFiled
    @IBOutlet var BuyerName: UITextField!
    @IBOutlet var Email: UITextField!
    @IBOutlet var Password: UITextField!
    @IBOutlet var Phone: UITextField!
    //label
    @IBOutlet var DisplayName: UILabel!
    @IBOutlet var LabelBuyerName: UILabel!
    @IBOutlet var LabelEmail: UILabel!
    @IBOutlet var LabelPassword: UILabel!
    @IBOutlet var LabelPhone: UILabel!
    
    @IBOutlet var ImageProfile: UIImageView!
    @IBOutlet var SaveButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        enableanddisableButtons()
        SVProgressHUD.dismiss()
        
        
      //  ApplyImgDesign()
        //Database
        
//        databaseReference = Database.database().reference()
//        if Auth.auth().currentUser?.uid == nil {
//
//        }
//        loadProfileData()
//
    }


    func enableanddisableButtons(){
    //Textfiled
    BuyerName.delegate = self
    BuyerName.isHidden = true
    Email.delegate = self
    Email.isHidden = true
    Password.delegate = self
    Password.isHidden = true
    Phone.delegate = self
    Phone.isHidden = true
    //label
    LabelBuyerName.isUserInteractionEnabled = true
    LabelEmail.isUserInteractionEnabled = true
    LabelPassword.isUserInteractionEnabled = true
    LabelPhone.isUserInteractionEnabled = true
    // hide save button
    SaveButton.isHidden = true
    }
    
    
    // Info Edit
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.resignFirstResponder()
            self.view.endEditing(true)
            return true
    }

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
        SaveButton.isHidden = true
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func handleLogout(_ sender: UIButton) {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "buyerLogout", sender: self)
    }
    
//    func loadProfileData(){
//
//        //if the user is logged in get the profile data
//
//        if let userID = Auth.auth().currentUser?.uid{
//            self.databaseReference.child("buyer").child(uid).observe(.value, with: { (snapshot) in
//
//                //create a dictionary of users profile data
//                let values = snapshot.value as? NSDictionary
//
//                //if there is a url image stored in photo
//                if let profileImageURL = values?["photo"] as? String{
//                    //using sd_setImage load photo
//                    self.profileImageView.sd_setImage(with: URL(string: profileImageURL))
//                }
//
//                self.usernameText.text = values?["username"] as? String
//
//
//                self.displayNameText.text = values?["display"] as? String
//
//
//                self.bioText.text = values?["bio"] as? String
//            })
//
//        }
//    }
//
//
//
//
//
//    //image
//    func ApplyImgDesign(){
//    ImageProfile.layer.cornerRadius = ImageProfile.frame.size.width / 2
//    ImageProfile.clipsToBounds = true
//    }
//    @IBAction func uploadImageButton(_ sender: Any) {
//        clickedButton = sender.restorationIdentifier
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.delegate = self
//        let actionSheet = UIAlertController(title: "Photo source", message: "Choose a sourse", preferredStyle: .actionSheet)
//        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default , handler: { (action:UIAlertAction) in
//            if UIImagePickerController.isSourceTypeAvailable(.camera){
//                imagePickerController.sourceType = .camera
//                self.present(imagePickerController, animated: true, completion: nil)
//            } else {
//                print("Camera is not available :) ")
//            }
//        }))
//        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default , handler: { (action:UIAlertAction) in
//            imagePickerController.sourceType = .photoLibrary
//            self.present(imagePickerController, animated: true, completion: nil)
//        }))
//        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil ))
//        self.present(actionSheet, animated: true, completion: nil )
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//

}
