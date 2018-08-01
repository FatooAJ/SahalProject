//
//  HomeViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 7/15/18.
//  Copyright © 2018 wadimakkah. All rights reserved.
//
import UIKit
import Firebase
import SDWebImage
class HomeViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    
    // Database
    var databaseReference = DatabaseReference()
    
    var ArrayOfitems = [Items]()
    
    var BodyProduct = [Items]()
    var externalProduct = [Items]()
    var engineProduct = [Items]()
    var electricProduct = [Items]()
    
    var ArrayOfImage = [String]()
    @IBOutlet var changesegment: UISegmentedControl!
    @IBOutlet var tableproduct: UITableView!
    
    @IBAction func BuyIconButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Database
        self.navigationItem.hidesBackButton = true
        databaseReference = Database.database().reference()
        GetDataFromFirebase()
        //  loadImages()
    }
    
    
    
    
    @IBAction func ProductCatigorie(_ sender: UISegmentedControl){
        tableproduct.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch changesegment.selectedSegmentIndex
        {
        case 0:
            return electricProduct.count
        case 1:
            return engineProduct.count
        case 2:
            return BodyProduct.count
        case 3:
            return externalProduct.count
        default:
            break;
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productcell", for: indexPath) as! ProductTableViewCell
        
        print(self.electricProduct.count)
        print(self.BodyProduct.count)
        print(self.externalProduct.count)
        print(self.engineProduct.count)
        
        switch changesegment.selectedSegmentIndex
        {
        case 0:
            let CellProduct = ArrayOfitems[indexPath.row]
            if CellProduct.category == "electric"{
                cell.titleproduct?.text = CellProduct.Title
                cell.price?.text = CellProduct.Price + "ريال "
                cell.city?.text = CellProduct.City
                cell.sellername?.text = CellProduct.sellerName
                
                let url = CellProduct.Img
                //print(url)
                cell.productimage?.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "noimage"))
            }
            cellDesign(cell: cell)
            
        case 1:
            // SHOWING THE PROFILE VIEW
            let CellProduct = ArrayOfitems[indexPath.row]
            if CellProduct.category == "engine"{
                cell.titleproduct?.text = CellProduct.Title
                cell.price?.text = CellProduct.Price + "ريال "
                cell.city?.text = CellProduct.City
                cell.sellername?.text = CellProduct.sellerName
                
                let url = CellProduct.Img
                //print(url)
                cell.productimage?.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "noimage"))
            }
            cellDesign(cell: cell)
            
            
        case 2:
            let CellProduct = ArrayOfitems[indexPath.row]
            if CellProduct.category == "body"{
                cell.titleproduct?.text = CellProduct.Title
                cell.price?.text = CellProduct.Price + "ريال "
                cell.city?.text = CellProduct.City
                cell.sellername?.text = CellProduct.sellerName
                
                let url = CellProduct.Img
                //print(url)
                cell.productimage?.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "noimage"))
            }
            cellDesign(cell: cell)
        case 3:
            let CellProduct = ArrayOfitems[indexPath.row]
            if CellProduct.category == "external"{
                cell.titleproduct?.text = CellProduct.Title
                cell.price?.text = CellProduct.Price + "ريال "
                cell.city?.text = CellProduct.City
                cell.sellername?.text = CellProduct.sellerName
                
                let url = CellProduct.Img
                //print(url)
                cell.productimage?.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "noimage"))
            }
            cellDesign(cell: cell)
            
        default:
            break;
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let itemID = self.ArrayOfitems[indexPath.row].ProductId
        let iteminfo = self.storyboard?.instantiateViewController(withIdentifier: "Viewproducttable") as! ProductDetilesViewController
        iteminfo.productID = itemID
        iteminfo.showProductDetail()
        
        self.navigationController?.pushViewController(iteminfo, animated: true)
        
    }
    func cellDesign(cell : ProductTableViewCell){
        
        //        //Tabel cell Style
        cell.mainBackground.layer.cornerRadius = 10
        cell.mainBackground.layer.masksToBounds = true
        cell.shadowLayer.layer.masksToBounds = false
        cell.shadowLayer.layer.shadowOffset = CGSize(width: CGFloat(0), height: CGFloat(3))
        cell.mainBackground.layer.backgroundColor = UIColor.white.cgColor
        cell.shadowLayer.layer.shadowColor = UIColor.gray.cgColor
        cell.shadowLayer.layer.shadowOpacity = 0.30
        cell.shadowLayer.layer.shadowRadius = 10
        cell.shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: cell.shadowLayer.bounds, byRoundingCorners:.allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        cell.shadowLayer.layer.shouldRasterize = true
        cell.shadowLayer.layer.rasterizationScale = UIScreen.main.scale
        cell.selectionStyle = .none
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    func GetDataFromFirebase(){
        
        self.databaseReference.child("item").observe(.childAdded) { (snapshots:DataSnapshot) in
            if let dectionary = snapshots.value as? [String:AnyObject] {
                let img = snapshots.childSnapshot(forPath: "itemImages")
                
                
                //                let item = Product(dectionary: dectionary, productID: snapshots.key)
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
                    
                    let Data = Items(Title: title!, City: city!, Img: image!, Price: price!, year: year!, status: status!, type: type!, description: description!, carname: carname!, factoryName: factoryName!, sellerID: sellerID!, sellerName: Sellername!,ProductId: snapshots.key, category: category!, ArrayOfImage: self.ArrayOfImage)
                    
                    print(self.ArrayOfitems)
                    
                    
                    if Data.category.contains("electric"){
                        self.electricProduct.append(Data)
                        
                    }
                    if Data.category.contains("body"){
                        self.BodyProduct.append(Data)
                        
                    }
                    if Data.category.contains("external"){
                        self.externalProduct.append(Data)
                        
                    }
                    if Data.category.contains("engine"){
                        self.engineProduct.append(Data)
                    }
                    self.ArrayOfitems.append(Data)}
                
                // self.Products.append(item)
                //   print(self.Products)
                
            }
            // print("imag here\(dectionary)")
            DispatchQueue.main.async {
                self.tableproduct.reloadData()
            }
        }
        
        
        
    }
    
    
}




    

