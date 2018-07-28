//
//  ProfileSellerViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 27/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class ProfileSellerViewController: UIViewController , UITextFieldDelegate, UIImagePickerControllerDelegate , UINavigationControllerDelegate  {
    
    // Database
    var databaseReference : DatabaseReference!
    // var storageRef: StorageReference!
    //let storage = Storage.storage().reference()
    
    //TextFiled
    @IBOutlet var SellerName: UITextField!
    @IBOutlet var Email: UITextField!
    @IBOutlet var Password: UITextField!
    @IBOutlet var Phone: UITextField!
    @IBOutlet var BR: UITextField!
    
    //label
    @IBOutlet var DisplayName: UILabel!
    @IBOutlet var LabelSellerName: UILabel!
    @IBOutlet var LabelEmail: UILabel!
    @IBOutlet var LabelPassword: UILabel!
    @IBOutlet var LabelPhone: UILabel!
    @IBOutlet var LabelBR: UILabel!
    
    @IBOutlet var ImageProfile: UIImageView!
    @IBOutlet var SaveButton: UIButton!
    
    @IBOutlet var editbutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enableanddisableButtons()
        ApplyImgDesign()
        //Database
        databaseReference = Database.database().reference()
        //storageRef = Storage.storage().reference()
        //        if Auth.auth().currentUser?.uid == nil {
        //            logoutt()
        //        }
        loadProfileData()
    }
    
    func enableanddisableButtons(){
        //Textfiled
        SellerName.delegate = self
        SellerName.isHidden = true
        Email.delegate = self
        Email.isHidden = true
        Password.delegate = self
        Password.isHidden = true
        Phone.delegate = self
        Phone.isHidden = true
        BR.delegate = self
        BR.isHidden = true
        //label
        LabelSellerName.isUserInteractionEnabled = true
        LabelEmail.isUserInteractionEnabled = true
        LabelPassword.isUserInteractionEnabled = true
        LabelPhone.isUserInteractionEnabled = true
        LabelBR.isUserInteractionEnabled = true
        // hide save button
        SaveButton.isHidden = true
    }
    
    // Info Edit
    @IBAction func EditButton(_ sender: UIButton) {
        //Show LAbel
        LabelSellerName.isHidden = true
        LabelEmail.isHidden = true
        LabelPassword.isHidden = true
        LabelPhone.isHidden = true
        LabelBR.isHidden = true
        //Hide Text Filed
        SellerName.isHidden = false
        Email.isHidden = false
        Password.isHidden = false
        Phone.isHidden = false
        BR.isHidden = false
        //Text equel Label
        SellerName.text = LabelSellerName.text
        Email.text = LabelEmail.text
        BR.text = LabelBR.text
        //Password.text = LabelPassword.text
        Phone.text = LabelPhone.text
        SaveButton.isHidden = false
        self.alertwindow()
    }
    func edit(){
        //Show LAbel
        LabelSellerName.isHidden = true
        LabelEmail.isHidden = true
        LabelPassword.isHidden = true
        LabelPhone.isHidden = true
        LabelBR.isHidden = true

        //Hide Text Filed
        SellerName.isHidden = false
        Email.isHidden = false
        Password.isHidden = false
        Phone.isHidden = false
        BR.isHidden = false

        //Text equel Label
        SellerName.text = LabelSellerName.text
        Email.text = LabelEmail.text
        BR.text = LabelBR.text
        //Password.text = LabelPassword.text
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
        LabelSellerName.isHidden = false
        LabelEmail.isHidden = false
        LabelPassword.isHidden = false
        LabelPhone.isHidden = false
        LabelBR.isHidden = false
        //Hide Text Filed
        SellerName.isHidden = true
        Email.isHidden = true
        Password.isHidden = true
        Phone.isHidden = true
        BR.isHidden = true
        //Text equel Label
        LabelSellerName.text = SellerName.text
        LabelEmail.text = Email.text
        LabelBR.text = BR.text
        //        LabelPassword.text = Password.text
        LabelPhone.text = Phone.text
        SaveButton.isHidden = true
        updateUsersProfile()
    }
    func saveit(){
        //Show LAbel
        LabelSellerName.isHidden = false
        LabelEmail.isHidden = false
        LabelPassword.isHidden = false
        LabelPhone.isHidden = false
        LabelBR.isHidden = false

        //Hide Text Filed
        SellerName.isHidden = true
        Email.isHidden = true
        Password.isHidden = true
        Phone.isHidden = true
        BR.isHidden = true
        SaveButton.isHidden = true
        
    }
    
    func loadProfileData(){
        let currentuser = Auth.auth().currentUser
        //if the user is logged in get the profile data
        if let userID = Auth.auth().currentUser?.uid{
            databaseReference.child("seller").child(userID).observe(.value, with: { (snapshot) in
                //create a dictionary of users profile data
                let values = snapshot.value as? NSDictionary
                //if there is a url image stored in photo
                print(values)
                
                self.LabelEmail.text = currentuser?.email
                self.DisplayName.text = values?["company"] as? String
                self.LabelSellerName.text = values?["company"] as? String
                self.LabelPhone.text = values?["number"] as? String
                self.LabelBR.text = values?["bR"] as? String
                
            })
        }
    }
    
    func updateUsersProfile(){
        //check to see if the user is logged in
        if let uid = Auth.auth().currentUser?.uid{
            //create an access point for the Firebase storage
            guard let newUserName  = self.SellerName.text else {return}
            guard let newphone = self.Phone.text else {return}
            guard let newBR = self.BR.text else {return}

            let newValuesForProfile =
                [ "bR": newBR,
                "company": newUserName,
                 "number": newphone]
            //update the firebase database for that user
            self.databaseReference.child("seller").child(uid).updateChildValues(newValuesForProfile, withCompletionBlock: { (error, ref) in
                if error != nil{
                    print(error!)
                    return
                }
                print("Profile Successfully Update")
                self.updateemailandpass()
            })
        }
    }
    
    func updateemailandpass(){
        guard let newemail  = self.Email.text else {return}
        guard let newpassword  = self.Password.text else {return}
        let currentuser = Auth.auth().currentUser
        currentuser?.updateEmail(to: newemail) { (error) in
            if error != nil {
                // self.alertwindow()
                print(error!)
            } else {
                // Email updated.
                print("email updated successfully")
                currentuser?.updatePassword(to: newpassword) { (error) in
                    if error != nil {
                        print(error!)
                    } else {
                        // Password updated.
                        print("password updated successfully")
                    }
                }
            }
        }
    }
    //Need to sign in to update password and email
    func alertwindow(){
        let alert = UIAlertController(title: "للأمان", message: "لتعديل معلوماتك ادخل الايميل وكلمة المرور", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "ادخل ايميلك هنا"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "كلمة المرور"
        })
        alert.addAction(UIAlertAction(title: "إلغاء", style: .default, handler: { action in
            print("cancel")
            self.saveit()
            
        }))
        alert.addAction(UIAlertAction(title: "إرسال", style: .default, handler: { action in
            let email = alert.textFields![0].text
            let pass =  alert.textFields![1].text
            self.needAuthUser(email: email!,pass: pass!)
        }))
        self.present(alert, animated: true)
    }
    func wrongalert(){
        let alert = UIAlertController(title: "نعتذر", message: "لقد قمت بإدخال بيانات غير صحيحه", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "حسنا", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func needAuthUser(email: String,pass: String){
        // let credential: AuthCredential
        let credential = EmailAuthProvider.credential(withEmail: email, password: pass)
        // Prompt the user to re-provide their sign-in credentials
        Auth.auth().currentUser?.reauthenticate(with: credential, completion: { (error) in
            if error != nil {
                // An error happened.
                print (error!)
                self.wrongalert()
                self.saveit()
            }
            else{
                print("succses AUTH")
                self.Password.text = pass
                self.edit()
            }
        })
    }
    
    //Profile image
    func ApplyImgDesign(){
        ImageProfile.layer.cornerRadius = ImageProfile.frame.size.width / 2
        ImageProfile.clipsToBounds = true
        self.ImageProfile?.image = UIImage(named: "profilee")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func handleLogout(_ sender: UIButton) {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "SellerLogout", sender: self)
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

