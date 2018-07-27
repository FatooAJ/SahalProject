//
//  addProductController.swift
//  sahal
//
//  Created by Ghufran nour  on 06/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class addProductController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    var clickedButton: String?
    
    var datatbaserefreence : DatabaseReference!
    
    var imagePicker : UIImagePickerController!
    
    var imagesArray = [UIImage]()
    var imageURLs = [String]()
    var counter = 0
    
    @IBOutlet weak var itemName: UITextField!
    
    @IBOutlet weak var descriptionOutlet: UITextView!
    
    @IBOutlet weak var firstImageOutlet: UIImageView!
    
    @IBOutlet weak var secondImageOutlet: UIImageView!
    
    @IBOutlet weak var thirdImageOutlet: UIImageView!
    
    @IBOutlet weak var fourthImageOutlet: UIImageView!
    
    
    @IBAction func addButton(_ sender: UIButton) {
        handleAddingProduct()
    }
    
    
    @IBAction func selectImg(_ sender: UIButton) {
        

        clickedButton = sender.restorationIdentifier
        

        let actionSheet = UIAlertController(title: "Photo source", message: "Choose a sourse", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default , handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            } else {
                
                print("Camera is not available :) ")
            }
            
            
            
        }))
        
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default , handler: { (action:UIAlertAction) in
            
             self.imagePicker.sourceType = .photoLibrary
            self.present( self.imagePicker, animated: true, completion: nil)
        }))
        
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil ))
        
        self.present(actionSheet, animated: true, completion: nil )
        
        
        
        
    }
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        if clickedButton == "button1" {
             firstImageOutlet.image = image
            imagesArray.append(image)
        } else if clickedButton == "button2"  {
            secondImageOutlet.image = image
            imagesArray.append(image)
        } else if clickedButton == "button3"  {
            thirdImageOutlet.image = image
            imagesArray.append(image)
        } else  {
            fourthImageOutlet.image = image
            imagesArray.append(image)
        }
       
        picker.dismiss(animated: true , completion: nil )
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil )
    }
    
    
    
    
    @IBOutlet weak var brandTextfeild: UITextField!
    @IBOutlet weak var typeTextfeild: UITextField!
    @IBOutlet weak var modelTextfeild: UITextField!
    @IBOutlet weak var partTextfeild: UITextField!
    
    
    let brands = ["Rose Rise" , "BMW" , "Ferari" , "Dodge"]
    let types = ["type 1" , "type 2" , "type 3" , "type 4"]
    let models = ["model 1 " , "model 2" , "model 3" , "model 4"]
    let parts = ["part " , "part 2 " , "part 3 " , "part 4"]
    
    
    var selectedBrand: String?
    var selectedType: String?
    var selectedModel: String?
    var selectedPart: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datatbaserefreence = Database.database().reference()
        createBrandPicker()
        createTypePicker()
        createModelPicker()
        createPartPicker()
        creatToolbar()
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
       
        if Auth.auth().currentUser?.uid == nil {
            logOut()
        }
    }

    func createBrandPicker(){
        let brandPicker = UIPickerView()
        brandPicker.tag = 0
        brandPicker.delegate = self
        brandTextfeild.inputView = brandPicker
    }
    
    
    func createModelPicker(){
        let modelPicker = UIPickerView()
        modelPicker.tag = 2
        modelPicker.delegate = self
        modelTextfeild.inputView = modelPicker
    }
    
    func createTypePicker(){
        let typePicker = UIPickerView()
        typePicker.tag = 1
        typePicker.delegate = self
        typeTextfeild.inputView = typePicker
    }
    
    func createPartPicker(){
        let partPicker = UIPickerView()
        partPicker.tag = 3
        partPicker.delegate = self
        partTextfeild.inputView = partPicker
    }
    
    func creatToolbar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain , target: self , action:#selector(dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        
        brandTextfeild.inputAccessoryView = toolBar
        partTextfeild.inputAccessoryView = toolBar
        modelTextfeild.inputAccessoryView = toolBar
        typeTextfeild.inputAccessoryView = toolBar
    }
    
    
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
}
extension addProductController : UIPickerViewDelegate , UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 0){
           return brands.count
        } else  if(pickerView.tag == 1) {
            return types.count
        } else  if(pickerView.tag   == 2) {
            return models.count
        } else if(pickerView.tag == 4 ) {
            return parts.count
        } else {
             return parts.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        
        if(pickerView.tag == 0){
            return brands[row]
        } else  if(pickerView.tag == 1) {
            return types[row]
        } else  if(pickerView.tag == 2) {
            return models[row]
        } else if(pickerView.tag == 3)  {
            return parts[row]
        } else {
            return parts[row]
        }
     
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == 0){
            selectedBrand = brands[row]
            brandTextfeild.text = selectedBrand
        } else if(pickerView.tag == 1)  {
            selectedType = types[row]
            typeTextfeild.text = selectedType
        }
        else if(pickerView.tag == 2)  {
            selectedModel = models[row]
            modelTextfeild.text = selectedModel
        }        else if(pickerView.tag == 4)  {
            selectedPart = parts[row]
            partTextfeild.text = selectedPart
        } else {
            selectedPart = parts[row]
            partTextfeild.text = selectedPart
        }
        
     
    }
    
    
    func logOut() {
        do{
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    
    
    func handleAddingProduct (){
     guard let itemValue = itemName.text,
           let descriptionValue = descriptionOutlet.text,
           let model = self.selectedModel,
           let part = selectedPart,
           let type = selectedType,
           let brand = selectedBrand else { return }
        
        
        let price = "50.00"
        let status = "متاحة"
        let sellerID = Auth.auth().currentUser?.uid
        
        print("I'm inside handleAddingProduct")
        
        

        
        
        
        self.uploading() { uploaded in
            print("inside final uploading")
            if uploaded == true {
                let urls = ["0":  self.imageURLs[0], "1":  self.imageURLs[1],"2":  self.imageURLs[2],"3":  self.imageURLs[3]]
                
                let value = ["buyerId":"none","itemImages":urls,"name":itemValue , "description":descriptionValue ,"factoryName" : brand  , "type" : type , "year" : model , "category" : part  , "price" : price , "status" : status , "sellerId" : sellerID! ] as [String : Any]
                
                
                self.productUploading(values: value)
            }
        }
      
        
       
        
    }
    
    
    func uploadProductImages(_ image : UIImage , completion : @escaping ((_ urls:String?)->()))  {
        let imageName = "\(Date().timeIntervalSinceNow)"
        let storageRefrence = Storage.storage().reference().child("items/\(imageName)")
        
            
            guard let imageData = UIImageJPEGRepresentation(image, 0.75) else {return}
            
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpg"
            
            storageRefrence.putData(imageData, metadata: metaData) { (metaData, error) in
                if error == nil && metaData != nil {
                    storageRefrence.downloadURL { (url, error) in
                        guard let downloadURL = url else {
                            // Uh-oh, an error occurred!
                            return
                        }
                        
                      completion(downloadURL.absoluteString)
                       
                       
                    }
                }else { completion(nil) }
                
            
        }
        
            
        }
    
    
     func uploading(completion : @escaping ((_ uploaded:Bool?)->()))  {
        
        for image in self.imagesArray {
            
            
            self.uploadProductImages(image) { url in
                
                print("I'm inside the images loop")
                
                self.imageURLs.append(url!)
                self.counter += 1
                print(self.counter)
                print(url!)
                
                if (self.counter == 4 ) {
                    print("inssssside completion")
                    completion(true)
                }
            }
            
            
        }
        
      
       
    }
    
    
    func productUploading(values: [String:Any]) {
        let itemRefrence = self.datatbaserefreence.child("items").childByAutoId()
       
        itemRefrence.updateChildValues(values, withCompletionBlock: {(error, refrence) in
            if error != nil {
                print(error!)
            } else {
                print("item is added")
            }})
    }
        
        
        }
        
        
    
            



    
    
    

