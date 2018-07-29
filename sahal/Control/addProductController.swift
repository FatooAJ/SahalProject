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
import DLRadioButton
import SVProgressHUD

class addProductController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    var selectedType : String?
    
    var clickedButton: String?
    
    var datatbaserefreence : DatabaseReference!
    
    var imagePicker : UIImagePickerController!
    
    var imagesArray = [UIImage]()
    var imageURLs = [String]()
    var counter = 0
    
    
    @IBOutlet weak var radio1: DLRadioButton!
    @IBOutlet weak var radio2: DLRadioButton!
    @IBOutlet weak var radio3: DLRadioButton!
    @IBOutlet weak var radio4: DLRadioButton!
    
    
    @IBOutlet weak var itemName: UITextField!
    
    @IBOutlet weak var descriptionOutlet: UITextView!
    
    @IBOutlet weak var cityOutlet: UITextField!
    
    
    @IBOutlet weak var priceOutlet: UITextField!
    
    
    @IBOutlet weak var firstImageOutlet: UIImageView!
    
    @IBOutlet weak var secondImageOutlet: UIImageView!
    
    @IBOutlet weak var thirdImageOutlet: UIImageView!
    
    @IBOutlet weak var fourthImageOutlet: UIImageView!
    
    
    @IBAction func addButton(_ sender: UIButton) {
        print("Hi")
       
            
            handleAddingProduct()
        
       
    }
    
   
    
    
    
    @IBAction func radioButtons(_ sender: DLRadioButton) {
        switch sender.selected() {
        case radio1 :
            selectedType = "electric"
            print("\(selectedType!)")
            break
        case radio2 :
            selectedType = "engine"
            print("\(selectedType!)")
            break
        case radio3 :
            selectedType = "body"
            print("\(selectedType!)")
            break
        case radio4 :
            selectedType = "external"
            print("\(selectedType!)")
            break
        default:
            break
        }
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
    
    
    let brands = ["تويوتا" , "مازدا" , "هونداي" , "هوندا",  "مرسيدس" , "بي ام دبليو" , "شفروليه"]
    let types = [ "كامري" , "لاند كروزر" , "كوريلا" , "سبارك" , "اكسنت" , "سوبارو" ]
    let models = ["2000" , "2001" , "2001" , "2002" , "2003" , "2004" , "2005" , "2006" , "2010" , "2012" , "2018"]
    let parts = ["type1" , "type2" , "type3" , "type4" , "type5"]
    
    
    var selectedBrand: String?
    var carName: String?
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
            carName = types[row]
            typeTextfeild.text = carName
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
        print("Hello")
        
     guard let itemValue = itemName.text,
           let descriptionValue = descriptionOutlet.text,
           let model = self.selectedModel,
           let part = selectedPart,
           let carName = carName,
           let brand = selectedBrand ,
           let price = priceOutlet.text,
           let city = cityOutlet.text ,
           let category = selectedType ,
           let image1 = firstImageOutlet.image,
           let image2 = secondImageOutlet.image,
           let image3 = thirdImageOutlet.image ,
           let image4 = fourthImageOutlet.image
           else {
            
            let alert = UIAlertController(title: "عذرًا", message: "جميع الحقول مطلوبة !", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "موافق", style: .default , handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
          print("I'm inside handleAddingProduct")
        
        SVProgressHUD.show()
       
        let status = "متاحة"
        let sellerID = Auth.auth().currentUser?.uid
        
        print("I'm inside handleAddingProduct")

        self.uploading() { uploaded in
            print("inside final uploading")
            if uploaded == true {
                let urls = ["0":  self.imageURLs[0], "1":  self.imageURLs[1],"2":  self.imageURLs[2],"3":  self.imageURLs[3]]
                
                let value = ["itemImages":urls,"itemName":itemValue , "description":descriptionValue ,"city" : city , "category": category ,"factoryName" : brand  , "carName" : carName , "year" : model , "type" : part  , "price" : price , "status" : status , "sellerId" : sellerID! , "buyerId":"none",] as [String : Any]
                
                
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
                print(" item is added")
                SVProgressHUD.dismiss()
               
                let alert = UIAlertController(title: "", message:"تم إضافة المنتج بنجاح" , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "حسنًا", style: .default , handler: nil))
                self.present(alert, animated: true, completion: nil)
                
              self.resetValues()
                self.performSegue(withIdentifier: "main", sender: self)
                
            }})
        
    }
    
    func resetValues(){
        
        firstImageOutlet.image = nil
        secondImageOutlet.image = nil
        thirdImageOutlet.image = nil
        fourthImageOutlet.image = nil
        
        itemName.text = ""
        descriptionOutlet.text = ""
        cityOutlet.text = ""
        priceOutlet.text = ""
        brandTextfeild.text = ""
        typeTextfeild.text = ""
        modelTextfeild.text = ""
        partTextfeild.text = ""
        counter = 0
    }
        
        
        }
        
        
    
            



    
    
    

