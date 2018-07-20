//
//  addProductController.swift
//  sahal
//
//  Created by Ghufran nour  on 06/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit

class addProductController: UIViewController {
    
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
        
        createBrandPicker()
        createTypePicker()
        createModelPicker()
        createPartPicker()
        
        creatToolbar()

        // Do any additional setup after loading the view.
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
        partTextfeild.tag = 3
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
        } else  if(pickerView.tag == 2) {
            return models.count
        } else if(pickerView.tag == 3) {
            return parts.count
        } else {
             return brands.count
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
            return models[row]
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
        }        else if(pickerView.tag == 3)  {
            selectedPart = parts[row]
            partTextfeild.text = selectedPart
        } else {
            selectedPart = parts[row]
            partTextfeild.text = selectedPart
        }
        
     
    }
    
    
    
}
