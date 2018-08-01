//
//  SearchViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 17/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit
import DropDown
import Firebase
import SDWebImage
class SearchViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource  {
 
    
    var databaseReference = DatabaseReference()
    var DataArray = [Items]()
    var FilteredData = [Items]()
    var filterDropDown = [String: String]()
    
    // var FilteredData = [Product]()
    var ALLDATA = [Product]()
    var ArrayOfImage = [String]()
    
    var companycars = ["Acura","Audi","BMW","Bugatii","Buik","Audi"]
    @IBOutlet var productcollection: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet var SearchOutlet: UIButton!
    @IBAction func Search(_ sender: UIButton) {
        if(filterDropDown["Year"] == "" && filterDropDown["carname"] == "" && filterDropDown["carpiece"] == "" && filterDropDown["cartype"] == "" && filterDropDown["factoryname"] == ""){ print("nil found")}
        else{
            filterContentForDropDown()
            productcollection.reloadData()
            print(filterDropDown)}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "بحث عام "
        self.navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
        databaseReference = Database.database().reference()
        setupDropDowns()
        dropDowns.forEach { $0.dismissMode = .automatic }
        dropDowns.forEach { $0.direction = .any }
        productcollection.dataSource = self
        productcollection.delegate = self
        let layout = self.productcollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing = 5
        fetchData()
        filterDropDown = ["Year":"","cartype":"","carname":"","factoryname":"","carpiece":""]
        
    }
    
    
    func fetchData(){
        self.databaseReference.child("item").observe(.childAdded) { (snapshots:DataSnapshot) in
            if let dectionary = snapshots.value as? [String:AnyObject] {
                let img = snapshots.childSnapshot(forPath: "itemImages")
                
                let item = Product(dectionary: dectionary, productID: snapshots.key)
                //   print(ite)
                //   print(img)
                let title = dectionary["name"] as? String
                let price = dectionary["price"] as? String
                let city = dectionary["city"] as? String
                let year = dectionary["year"] as? String
                let status = dectionary["status"] as? String
                let type = dectionary["type"] as? String
                let description = dectionary["description"] as? String
                let carname = dectionary["carName"] as? String
                let factoryName = dectionary["factoryName"] as? String
                let sellerID = dectionary["sellerId"] as? String
                let category = dectionary["category"] as? String
                let image = img.childSnapshot(forPath: "0").value as? String
                self.databaseReference.child("seller").child(sellerID!).child("company").observe(.value) { (snapshot:DataSnapshot) in
                    let Sellername = snapshot.value as? String
                    print("sellername\(Sellername!)")
                    for count in 0...3 {
                        let imgarray = img.childSnapshot(forPath: "\(count)").value as? String
                        self.ArrayOfImage.append(imgarray!)
                    }
                    let Data = Items(Title: title!, City: city!, Img: image!, Price: price!, year: year!, status: status!, type: type!, description: description!, carname: carname!, factoryName: factoryName!, sellerID: sellerID!, sellerName: Sellername!,ProductId: snapshots.key, category: category!, ArrayOfImage:self.ArrayOfImage)
                    // self.DataArray = SearchData(Title:"\(dectionary["itemName"] as? String)")
                    self.DataArray.append(Data)
                    print(self.DataArray)
                    
                    
                    //   self.Data.append(data!)
                    self.ALLDATA.append(item)
                }
                
            }
            // print("imag here\(dectionary)")
            //            DispatchQueue.main.async {
            //                self.tableproduct.reloadData()
            //            }
        }
    }
    
    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        print(searchText)
        FilteredData = DataArray.filter({(searchdata: Items) -> Bool in
            return searchdata.Title.contains(searchText)})
        productcollection.reloadData()
        
    }
    func filterContentForDropDown() {
        
        FilteredData = DataArray.filter({(searchdata: Items) -> Bool in
            return (searchdata.year == filterDropDown["Year"] || filterDropDown["Year"] == "") &&
                (searchdata.carname == filterDropDown["carname"] || filterDropDown["carname"] == "") &&
                (searchdata.category == filterDropDown["carpiece"] || filterDropDown["carpiece"] == "") &&
                (searchdata.type == filterDropDown["cartype"] || filterDropDown["cartype"] == "") &&
                (searchdata.factoryName == filterDropDown["factoryname"] || filterDropDown["factoryname"] == "")
        })
        
        print(FilteredData)
        productcollection.reloadData()
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering() {
            return FilteredData.count
        }
        
        return FilteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productcell", for: indexPath) as! SearchResultCollectionViewCell
        
        let searchdata: Items
        searchdata = FilteredData[indexPath.row]
        cell.price?.text = searchdata.Price + "ريال"
        cell.city?.text = searchdata.City
        cell.titleproduct?.text = searchdata.Title
        cell.sellername?.text = searchdata.sellerName
        let url = searchdata.Img
        //print(url)
        cell.productimage?.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "noimage"))
        
        
        
        
        
        
        cellDesign(cell: cell)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let searchdata = self.FilteredData[indexPath.row].ProductId
        let iteminfo = self.storyboard?.instantiateViewController(withIdentifier: "Viewproductcollection") as! ProductDetilesViewController
        iteminfo.productID = searchdata
        iteminfo.cleaner()
        iteminfo.showProductDetail()
        
        self.navigationController?.pushViewController(iteminfo, animated: true)
        
    }
    
    
    
    //   MARK: - Segues
    
    func cellDesign(cell: SearchResultCollectionViewCell){
        cell.mainBackground.layer.cornerRadius = 10
        cell.mainBackground.layer.masksToBounds = true
        cell.shadowLayer.layer.masksToBounds = false
        cell.shadowLayer.layer.shadowOffset = CGSize(width: CGFloat(0), height: CGFloat(3))
        cell.mainBackground.layer.backgroundColor = UIColor.white.cgColor
        cell.shadowLayer.layer.shadowColor = UIColor.gray.cgColor
        cell.shadowLayer.layer.shadowOpacity = 0.10
        
        cell.shadowLayer.layer.shadowRadius = 10
        cell.shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: cell.shadowLayer.bounds, byRoundingCorners:.allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        cell.shadowLayer.layer.shouldRasterize = true
        cell.shadowLayer.layer.rasterizationScale = UIScreen.main.scale
        cell.mainBackground.layer.borderWidth = 0.50
        cell.mainBackground.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
        setupCarNamesDropDown()
        setupCarTypeDropDown()
        setupCarPieceDropDown()
    }
    
    func SetupCompanyDrop(){
        Company.anchorView = CompaniesDropDown // UIView or UIBarButtonItem
        Company.dataSource = ["الشركة المصنعة","هونداي","تويوتا","BMW","Bugatii","Buik","Audi","Acura","Audi","BMW","Bugatii","Buik","Audi"]
        Company.direction = .bottom
        Company.bottomOffset = CGPoint(x: 0, y:(Company.anchorView?.plainView.bounds.height)!)
        Company.cellNib = UINib(nibName: "MyCell", bundle: nil)
        //dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        //  guard let cell = cell as? MyCell else { return }
        //cell.suffixLabel.text = "Suffix \(companycars.)"
        Company.selectionAction = { [weak self] (index: Int, item: String) in
            self?.CompaniesDropDown.setTitle(item, for: .normal)
            if item=="الشركة المصنعة" {
                self?.CompaniesDropDown.setTitle("الشركة المصنعة", for: .normal)
                self?.filterDropDown["factoryname"] = ""
            }
            else{
                self?.filterDropDown["factoryname"] = item}
            
        }
        
    }
    func setupYearsDropDown() {
        Years.anchorView = YearsDropDown
        
        // Will set a custom with instead of anchor view width
        //        dropDown.width = 100
        
        // By default, the dropdown will have its origin on the top left corner of its anchor view
        // So it will come over the anchor view and hide it completely
        // If you want to have the dropdown underneath your anchor view, you can do this:
        Years.bottomOffset = CGPoint(x: 0, y:(Years.anchorView?.plainView.bounds.height)!)
        Years.direction = .bottom
        
        // You can also use localizationKeysDataSource instead. Check the docs.
        Years.dataSource = [
            "سنة الصنع",
            "2000",
            "2001",
            "2002",
            "2003",
            "2005",
            "2010",
            "2011",
            "2012",
            "2013",
            "2014"
        ]
        // Action triggered on selection
        Years.selectionAction = { [weak self] (index, item) in
            self?.YearsDropDown.setTitle(item, for: .normal)
            if item=="سنة الصنع" {
                self?.YearsDropDown.setTitle("سنة الصنع", for: .normal)
                self?.filterDropDown["Year"] = ""
            }
            else{
                self?.filterDropDown["Year"] = item}
            
        }
        Years.cellNib = UINib(nibName: "MyCell", bundle: nil)
        
    }
    func setupCarNamesDropDown(){
        CarName.anchorView = CarNameDropDown // UIView or UIBarButtonItem
        CarName.dataSource = ["اسم السيارة","كامري","Audi","BMW","Bugatii","Buik","Audi","Acura","Audi","BMW","Bugatii","Buik","Audi"]
        CarName.direction = .bottom
        CarName.bottomOffset = CGPoint(x: 0, y:(CarName.anchorView?.plainView.bounds.height)!)
        CarName.cellNib = UINib(nibName: "MyCell", bundle: nil)
        //dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        //  guard let cell = cell as? MyCell else { return }
        //cell.suffixLabel.text = "Suffix \(companycars.)"
        CarName.selectionAction = { [weak self] (index: Int, item: String) in
            self?.CarNameDropDown.setTitle(item, for: .normal)
            if item=="اسم السيارة" {
                self?.CarNameDropDown.setTitle("اسم السيارة", for: .normal)
                self?.filterDropDown["carname"] = ""
            }
            else{
                self?.filterDropDown["carname"] = item}
            
        }
        
    }
    func setupCarTypeDropDown(){
        CarType.anchorView = CarTypeDropDown // UIView or UIBarButtonItem
        CarType.dataSource = ["نوع السيارة","رياضية","سيدان","هاتشاباك","عائلية"]
        CarType.direction = .bottom
        CarType.bottomOffset = CGPoint(x: 0, y:(CarType.anchorView?.plainView.bounds.height)!)
        CarType.cellNib = UINib(nibName: "MyCell", bundle: nil)
        CarType.selectionAction = { [weak self] (index: Int, item: String) in
            self?.CarTypeDropDown.setTitle(item, for: .normal)
            if item=="نوع السيارة"{
                self?.CarTypeDropDown.setTitle("نوع السيارة", for: .normal)
                self?.filterDropDown["cartype"] = ""
            }
            else{
                self?.filterDropDown["cartype"] = item}
        }
    }
    
    
    
    
    
    func setupCarPieceDropDown(){
        CarPiece.anchorView = CarPieceDropDown // UIView or UIBarButtonItem
        CarPiece.dataSource = ["فئة القطعة","قطع خارجية","هيكل","محرك","كهربة"]
        CarPiece.direction = .bottom
        CarPiece.bottomOffset = CGPoint(x: 0, y:(CarPiece.anchorView?.plainView.bounds.height)!)
        CarPiece.cellNib = UINib(nibName: "MyCell", bundle: nil)
        CarPiece.selectionAction = { [weak self] (index: Int, item: String) in
            self?.CarPieceDropDown.setTitle(item, for: .normal)
            if item=="فئة القطعة"{
                self?.CarPieceDropDown.setTitle("فئة القطعة", for: .normal)
                self?.filterDropDown["carpiece"] = ""
            }
            else{
                self?.filterDropDown["carpiece"] = item}
        }
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
    
    
    
    
}

extension SearchViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
