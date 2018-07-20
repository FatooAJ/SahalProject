//
//  SearchViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 17/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit
import DropDown
class SearchViewController: UIViewController {
    
    //MARK: - DropDown's
    let Company = DropDown()
    let Years = DropDown()
    let CarName = DropDown()
    let CarType = DropDown()
    let CarPiece = DropDown()
    //MARK: - Properties
    @IBOutlet var CompaniesDropDown: UIButton!
    @IBOutlet var YearsDropDown: UIButton!
    @IBOutlet var CarNameDropDown: UIButton!
    @IBOutlet var CarTypeDropDown: UIButton!
    @IBOutlet var CarPieceDropDown: UIButton!
    
    
    var companycars = ["Acura","Audi","BMW","Bugatii","Buik","Audi"]
    
    lazy var dropDowns: [DropDown] = {
        return [
            self.Company,
            self.Years,
            self.CarName,
            self.CarType,
            self.CarPiece
        ]
    }()
    
    @IBAction func CompanyButton(_ sender: UIButton) {
        Company.show()
    }
    @IBAction func YearsButton(_ sender: UIButton) {
        Years.show()
    }
    @IBAction func CarNameButton(_ sender: UIButton) {
        CarName.show()
    }
    @IBAction func CarTypeButton(_ sender: UIButton) {
        CarType.show()
    }
    @IBAction func CarPieceButton(_ sender: UIButton) {
        CarPiece.show()
    }
    
    func setupDefaultDropDown() {
        DropDown.setupDefaultAppearance()
        
        dropDowns.forEach {
            $0.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
            $0.customCellConfiguration = nil
        }
    }
    
    func setupDropDowns() {
        SetupCompanyDrop()
        setupYearsDropDown()
        //setupCarNamesDropDown()
        //setupCarTypeDropDown()
        //setupCarPieceDropDown()
    }
    
    func SetupCompanyDrop(){
        Company.anchorView = CompaniesDropDown // UIView or UIBarButtonItem
        Company.dataSource = ["Acura","Audi","BMW","Bugatii","Buik","Audi","Acura","Audi","BMW","Bugatii","Buik","Audi"]
        Company.direction = .bottom
        Company.bottomOffset = CGPoint(x: 0, y:(Company.anchorView?.plainView.bounds.height)!)
        Company.cellNib = UINib(nibName: "MyCell", bundle: nil)
        //dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        //  guard let cell = cell as? MyCell else { return }
        //cell.suffixLabel.text = "Suffix \(companycars.)"
        Company.selectionAction = { [weak self] (index: Int, item: String) in
            self?.CompaniesDropDown.setTitle(item, for: .normal)}
    }
    func setupYearsDropDown() {
        Years.anchorView = YearsDropDown
        
        // Will set a custom with instead of anchor view width
        //        dropDown.width = 100
        
        // By default, the dropdown will have its origin on the top left corner of its anchor view
        // So it will come over the anchor view and hide it completely
        // If you want to have the dropdown underneath your anchor view, you can do this:
        Years.bottomOffset = CGPoint(x: 0, y: Years.bounds.height)
        Years.direction = .bottom
        
        // You can also use localizationKeysDataSource instead. Check the docs.
        Years.dataSource = [
            "1899",
            "2010",
            "2017",
            "1493",
            "2011"
        ]
        // Action triggered on selection
        Years.selectionAction = { [weak self] (index, item) in
            self?.YearsDropDown.setTitle(item, for: .normal)
        }
        Years.cellNib = UINib(nibName: "MyCell", bundle: nil)
        //dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        //  guard let cell = cell as? MyCell else { return }
        //cell.suffixLabel.text = "Suffix \(companycars.)"
        
        
        
        
        // Action triggered on dropdown cancelation (hide)
        //        dropDown.cancelAction = { [unowned self] in
        //            // You could for example deselect the selected item
        //            self.dropDown.deselectRowAtIndexPath(self.dropDown.indexForSelectedRow)
        //            self.actionButton.setTitle("Canceled", forState: .Normal)
        //        }
        
        // You can manually select a row if needed
        //        dropDown.selectRowAtIndex(3)
    }
    
    func customizeDropDown(_ sender: AnyObject) {
        let appearance = DropDown.appearance()
        
        appearance.cellHeight = 40
        appearance.backgroundColor = UIColor(white: 1, alpha: 1)
        appearance.selectionBackgroundColor = UIColor(red: 33, green: 101, blue: 130, alpha: 0.2)
        appearance.separatorColor = UIColor(white: 0.7, alpha: 0.8)
        appearance.cornerRadius = 10
        //appearance.shadowColor = UIColor(red: 0.6494, alpha: 1)
        appearance.shadowOpacity = 0
        appearance.shadowRadius = 25
        appearance.animationduration = 0.25
        appearance.textColor = .black
        appearance.textFont = UIFont(name: "Georgia", size: 14)!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDropDowns()
        dropDowns.forEach { $0.dismissMode = .onTap }
        dropDowns.forEach { $0.direction = .any }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
