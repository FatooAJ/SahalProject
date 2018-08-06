//
//  editeProduct.swift
//  sahal
//
//  Created by Ghufran nour  on 19/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import DLRadioButton
import SDWebImage
import SVProgressHUD

class editeProduct: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

  //  @IBOutlet weak var titleLable: UILabel!
    
    var selectedType : String?
    
    var clickedButton: String?
    
    var imagePicker : UIImagePickerController!
    
    var imagesArray = [UIImage]()
    var imageURLs = [String]()
    var counter = 0
    
    var titleString : String!
    var id : String!
    var ref : DatabaseReference!
    var product : Product!
    
    
    @IBOutlet weak var itemName: UITextField!
    
    @IBOutlet weak var itemDescription: UITextView!
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var itemPrice: UITextField!
    
    @IBOutlet weak var electric: DLRadioButton!
    
    @IBOutlet weak var engine: DLRadioButton!
    
    @IBOutlet weak var body: DLRadioButton!
    
    @IBOutlet weak var external: DLRadioButton!
    
    @IBOutlet weak var factoryName: UITextField!
    
    @IBOutlet weak var carName: UITextField!
    
    @IBOutlet weak var year: UITextField!
    
    @IBOutlet weak var carType: UITextField!
    
    let factoryArray = ["تويوتا" , "مازدا" , "هونداي" , "هوندا",  "مرسيدس" , "بي ام دبليو" , "شفروليه"]
    let carNameArray = [ "كامري" , "لاند كروزر" , "كوريلا" , "سبارك" , "اكسنت" , "سوبارو" ]
    let yearArray = ["2000" , "2001" , "2001" , "2002" , "2003" , "2004" , "2005" , "2006" , "2010" , "2012" , "2018"]
    let typeArray = ["سيدان" , "هاتشاباك" , "عائلية" , "رياضية"]
    
    var selectedBrand: String?
    var selectedCar: String?
    var selectedModel: String?
    var selectedPart: String?
    
    
    @IBAction func editeButton(_ sender: UIButton) {
        handleEditingProduct()
    }
    
    
    @IBAction func radioButtons(_ sender: DLRadioButton) {
        switch sender.selected() {
        case electric :
            selectedType = "electric"
            print("\(selectedType!)")
            break
        case engine :
            selectedType = "engine"
            print("\(selectedType!)")
            break
        case body :
            selectedType = "body"
            print("\(selectedType!)")
            break
        case external :
            selectedType = "external"
            print("\(selectedType!)")
            break
        default:
            break
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         ref = Database.database().reference()
        fetchProduct()
        
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
        factoryName.inputView = brandPicker
    }
    
    
    func createModelPicker(){
        let modelPicker = UIPickerView()
        modelPicker.tag = 2
        modelPicker.delegate = self
        year.inputView = modelPicker
    }
    
    func createTypePicker(){
        let typePicker = UIPickerView()
        typePicker.tag = 3
        typePicker.delegate = self
        carType.inputView = typePicker
    }
    
    func createPartPicker(){
        let partPicker = UIPickerView()
        partPicker.tag = 1
        partPicker.delegate = self
        carName.inputView = partPicker
    }
    
    func creatToolbar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain , target: self , action:#selector(dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        
        factoryName.inputAccessoryView = toolBar
        carName.inputAccessoryView = toolBar
        year.inputAccessoryView = toolBar
        carType.inputAccessoryView = toolBar
    }
    
    
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    

    
    
    func logOut() {
        do{
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setId(id : String)  {
        self.id = id
    }
    
    
    func fetchProduct() {
     
        self.ref.child("items").child(self.id).observeSingleEvent(of: .value) { (snapshot) in
            let dictionry = snapshot.value as? [String:AnyObject]
            self.product = Product(dectionary: dictionry!, productID: self.id)
            
            
            self.itemName.text = self.product.producttitle
            self.itemDescription.text = self.product.productdescription
            self.city.text = self.product.City
            self.itemPrice.text = self.product.Price
            self.factoryName.text = self.product.Companyname
            self.selectedBrand = self.product.Companyname
            self.carName.text = self.product.carname
            self.selectedCar = self.product.carname
            self.year.text = self.product.year
            self.selectedModel = self.product.year
            self.carType.text = self.product.type
            self.selectedPart = self.product.type
            
            let category =  self.product.Category
             print(category)
            
       //    let value =  self.body.isSelected
            
            if category! == "محركات - وقود"{
                
                self.electric.isSelected = true
                self.selectedType = "محركات - وقود"
                
            } else if category! == "جير - شاسيه" {
                self.body.isSelected = true
                self.selectedType = "جير - شاسيه"
                
            } else if category! == "بودي" {
                self.engine.isSelected = true
                 self.selectedType = "بودي"
                
            } else if category! == "كهرباء" {
                self.external.isSelected = true
                 self.selectedType = "كهرباء"
            }
            
            
        }
    }
  
}

extension editeProduct : UIPickerViewDelegate , UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 0){
            return factoryArray.count
        } else  if(pickerView.tag == 1) {
            return carNameArray.count
        } else  if(pickerView.tag   == 2) {
            return yearArray.count
        } else if(pickerView.tag == 3 ) {
            return typeArray.count
        } else {
            return typeArray.count
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if(pickerView.tag == 0){
            return factoryArray[row]
        } else  if(pickerView.tag == 1) {
            return carNameArray[row]
        } else  if(pickerView.tag == 2) {
            return yearArray[row]
        } else if(pickerView.tag == 3)  {
            return typeArray[row]
        } else {
            return typeArray[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == 0){
            selectedBrand = factoryArray[row]
            factoryName.text = selectedBrand
        } else if(pickerView.tag == 1)  {
            selectedCar = carNameArray[row]
            carName.text = selectedCar
        }
        else if(pickerView.tag == 2)  {
            selectedModel = yearArray[row]
            year.text = selectedModel
        }        else if(pickerView.tag == 4)  {
            selectedPart = typeArray[row]
            carType.text = selectedPart
        } else {
            selectedPart = typeArray[row]
            carType.text = selectedPart
        }
        
        
    }
    
    func handleEditingProduct (){
        
        guard let itemValue = itemName.text,
            let descriptionValue = itemDescription.text,
            let year = self.selectedModel,
            let type = selectedPart,
            let carName = selectedCar,
            let brand = selectedBrand ,
            let price = itemPrice.text ,
            let city = city.text ,
            let category = selectedType
            
            else {
                
                let alert = UIAlertController(title: "عذرًا", message: "جميع الحقول مطلوبة !", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "موافق", style: .default , handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                return
        }
        
        print("I'm inside handleEditingProduct")
        
         SVProgressHUD.show()
        
        print("I'm inside handleEditingProduct")
        
        let value = ["itemName":itemValue , "description":descriptionValue ,"city" : city , "category": category ,"factoryName" : brand  , "carName" : carName , "year" : year , "type" : type  , "price" : price ]
        
        self.ref.child("items").child(self.id).updateChildValues(value, withCompletionBlock: {(error, refrence) in
            print(value)
            if error != nil {
                print(error!)
            } else {
                print(" item is edited")
                SVProgressHUD.dismiss()
                
                let alert = UIAlertController(title: "", message:"تم تعديل البيانات بنجاح" , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "حسنًا", style: .default , handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }})
    
        
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    
    
}
