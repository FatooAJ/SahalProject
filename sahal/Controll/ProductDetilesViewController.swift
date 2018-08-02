//
//  ProductDetilesViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 16/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class ProductDetilesViewController: UIViewController ,
UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource {
    
    var databaseReference = DatabaseReference()
    var PRODUCT = Product()
    var Item: Items?
    var ALLCOMMENTS = [Comments]()
    var ArrayOfImage = [String]()
    var ArrayOfitems = [Items]()
    
    @IBAction func BuyIcon(_ sender: UIButton) {
        Cart.sharedInstance.addProduct(product: Item!)
    }
    //Tags
    @IBOutlet var companyname: UILabel!
    @IBOutlet var Years: UILabel!
    @IBOutlet var carname: UILabel!
    @IBOutlet var cartype: UILabel!
    @IBOutlet var piece: UILabel!
    //Product Details
    @IBOutlet var TitleProduct: UILabel!
    @IBOutlet var Description: UILabel!
    @IBOutlet var City: UILabel!
    @IBOutlet var SellerName: UILabel!
    @IBOutlet var Price: UILabel!
    
    //Product Image
    @IBOutlet var imagecontrol: UIPageControl!
    @IBOutlet var imagescrol: UIScrollView!
    
    //Table
    @IBOutlet var CommentsTable: Table!
    @IBOutlet var scroll: UIScrollView!
    
    @IBOutlet var Textcomments: UITextField!
    var productID : String?
    
    
    // var comments = ["I want to buy it","Do not buy it","Shiiiit ","What this????","answer me","I want to buy it"]
    // var username = ["Ahmed","Mohammed","Jehad","Ahmed","Mohammed","Jehad"]
    //  var images: [String] = ["1.jpeg","2.jpeg","3.jpg","4.jpg","5.jpg"]
    var frame = CGRect(x:0,y:0,width:0,height:0)
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Tags Style
        
        cleaner()
        
        
        scroll.contentSize.height = 300

        configureTabelView()
        
        databaseReference = Database.database().reference()
        showProductDetail()
        self.imagecontrol.numberOfPages = ArrayOfImage.count
        
    }
    
    func cleaner(){
        
        ArrayOfImage = []
    }
//    func showProductDetail(){
//
//        //print(self.companyname)
//        print("here\(self.productID!)")
//        self.databaseReference.child("items").child(self.productID!).observe(.value) { (snapshot) in
//            let value = snapshot.value as? [String: AnyObject]
//            // print(value)
//            let title = value?["itemName"] as? String?
//            print(title)
//            self.TitleProduct.text = title!
//            let sellerID = value?["sellerId"] as? String?
//            print(sellerID)
////            self.databaseReference.child("seller").child(sellerID!!).child("companyName").observe(.value) { (snapshots:DataSnapshot) in
////                let Sellername = snapshots.value as? String
////                self.SellerName.text = Sellername
////                print("sellername\(Sellername!)")}
//            //  print(title)
//            //var arrayimage = [String]()
//            for index in 0...3{
//                let img = snapshot.childSnapshot(forPath: "itemImages").childSnapshot(forPath: "\(index)").value as? String
//
//                self.ArrayOfImage.append(img!)
//                print("fetching from array\(index)")
//            }
//            print("!!!!!\(self.ArrayOfImage.count)")
//            self.ProductImageScroll(ArrayOfImage: self.ArrayOfImage)
//            self.settinguplabels()
//
//            var PRODUCT = Product()
//            //print(snapshots.value as? [String:AnyObject])
//            if let dectionary = snapshot.value as? [String:AnyObject] {
//                let productOBJ = Product(dectionary: dectionary, productID: snapshot.key)
//                PRODUCT = productOBJ
//            }
//            self.PRODUCT = PRODUCT
//            print(self.PRODUCT)
//
//        }
//
//    }
        func showProductDetail(){
    
            //print(self.companyname)
            print("here\(self.productID!)")
            self.databaseReference.child("items").child(self.productID!).observe(.value) { (snapshot) in
                let dectionary = snapshot.value as? [String: AnyObject]
                let img = snapshot.childSnapshot(forPath: "itemImages")
                //  print(dectionary)
                let title = dectionary?["itemName"] as? String
                let price = dectionary?["price"] as? String
                let city = "مكة المكرمة"
                let year = dectionary?["year"] as? String
                let status = dectionary?["status"] as? String
                let type = dectionary?["type"] as? String
                let description = dectionary?["description"] as? String
                let carname = dectionary?["carName"] as? String
                let factoryName = dectionary?["factoryName"] as? String
                let sellerID = dectionary?["sellerId"] as? String
                let category = dectionary?["category"] as? String
                let image = img.childSnapshot(forPath: "0").value as? String
                for index in 0...3{
                    let img = snapshot.childSnapshot(forPath: "itemImages").childSnapshot(forPath: "\(index)").value as? String
                    
                    self.ArrayOfImage.append(img!)
                    print("fetching from array\(index)")
                }
                print("!!!!!\(self.ArrayOfImage.count)")
                self.ProductImageScroll(ArrayOfImage: self.ArrayOfImage)
                self.databaseReference.child("seller").child(sellerID!).child("companyName").observe(.value) { (snapshot:DataSnapshot) in
                        let Sellername = snapshot.value as? String
                        print("sellername\(Sellername!)")
                    var item : Items

                    let Data = Items(Title: title!, City: city, Img: image!, Price: price!, year: year!, status: status!, type: type!, description: description!, carname: carname!, factoryName: factoryName!, sellerID: sellerID!, sellerName: Sellername!,ProductId: snapshot.key, category: category!, ArrayOfImage: self.ArrayOfImage)
                    self.ArrayOfitems.append(Data)
                        print(Data)
                    item = Data
                    self.Item = item
                   // print(self.cartype.text)
                    self.settinguplabels()
                }
                
                    }
    
        }
    
    // image Scroll Func
    func ProductImageScroll(ArrayOfImage: [String]){
        
        print(ArrayOfImage.count)
        self.imagecontrol.numberOfPages = ArrayOfImage.count
        
        // Do any additional setup after loading the view.
        // let image = PRODUCT.imgproduct[]
        for index in 0...3 {
            //  print("here hrer !!\(Arrayimage[index])")
            frame.origin.x = imagescrol.frame.size.width * CGFloat(index)
            frame.size = imagescrol.frame.size
            let imgView = UIImageView(frame: frame)
            let url = ArrayOfImage[index]
            imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "noimage"))
            //  imgView.image = UIImage(named: images[index])
            self.imagescrol.addSubview(imgView)
        }
        imagescrol.contentSize = CGSize(width:(imagescrol.frame.size.width * CGFloat(ArrayOfImage.count)), height: imagescrol.frame.size.height)
        imagescrol.delegate = self
    }
    func scrollViewDidEndDecelerating(_ imagescrol: UIScrollView){
        var pageNumber = imagescrol.contentOffset.x / imagescrol.frame.size.width
        imagecontrol.currentPage = Int(pageNumber)
    }
    
    //table Func
    @IBAction func addRow(_ sender: UIButton) {
        let databaseREF = databaseReference.child("Comments")
        let currentUser = Auth.auth().currentUser
        let senderName = currentUser?.displayName
        let senderID = currentUser?.uid
        let values = ["SenderName":senderName!,"SenderID": senderID!,"Comments": Textcomments.text!] as [String:AnyObject]
        databaseREF.updateChildValues(values)
        
        //Textcomments.text = ""
        count = count + 1
        CommentsTable.reloadData()
        scroll.contentSize.height = 500 + CommentsTable.contentSize.height
        //CommentsTable.frame.size.height = CommentsTable.contentSize.height+50
        // CommentsTable.maxHeight = CommentsTable.contentSize.height
        print(CommentsTable.contentSize.height)
    }
    func loadMessages() {
        databaseReference = Database.database().reference()
        databaseReference.child("Comments").observe(.value, with: { (snapshot) in
            //  print("heeeere\(snapshot)")
            if let dectionary = snapshot.value as? [String:AnyObject] {
                // print("heeeere\(dectionary)")
                let comment = Comments(dectionary: dectionary)
                
                self.ALLCOMMENTS.append(comment)
                self.CommentsTable.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tableView.frame.size = tableView.contentSize
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentcell", for: indexPath) as! CommentsTableViewCell
        //  let comment = ALLCOMMENTS[indexPath.row]
        //  cell.commentText?.text = comment.CommentsFromUser
        //cell.Username?.text = comment.BuyerName
        
        
        //let user = username[indexPath.row]
        //let comment = comments[indexPath.row]
        let tt1 =  Textcomments.text!
        cell.commentText?.text = tt1
        //   cell.commentText?.text = comment
        cell.Username?.text = "User name  \([indexPath.row+1])"
        //
        // cell.commentText?.text = "name \([indexPath.row+1])"
        
        //Tabel cell Style
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.shouldRasterize = true
        cell.selectionStyle = .none
        
        return cell
    }
    
        func settinguplabels(){
    
            TitleProduct.text = self.Item?.Title
            Description.text = self.Item?.description
            Price.text = self.Item?.Price
            City.text = self.Item?.City
            SellerName.text = self.Item?.sellerName
    
            //tags
            companyname.text = self.Item?.factoryName
            Years.text = self.Item?.year
            carname.text = self.Item?.carname
            cartype.text = self.Item?.type
            piece.text = self.Item?.category
    
            print("------------------")
            print(companyname.text)
            print(Years.text)
            print(carname.text)
    
    
    
    
        }
//    func settinguplabels(){
//
//        TitleProduct.text = self.PRODUCT.producttitle
//        Description.text = self.PRODUCT.productdescription
//        Price.text = self.PRODUCT.Price + "ريال"
//        City.text = self.PRODUCT.City
//        // SellerName.text = self.PRODUCT.sellername
//
//        // self.City.text = value?["city"] as? String
//
//        //tags
//        companyname.text = self.PRODUCT.Companyname
//        Years.text = self.PRODUCT.year
//        carname.text = self.PRODUCT.carname
//        cartype.text = self.PRODUCT.type
//        piece.text = self.PRODUCT.Category
//
//        //  print(self.PRODUCT.)
//        print(self.PRODUCT.year)
//
//
//
//
//    }
    
    func configureTabelView() {
        CommentsTable.rowHeight = UITableViewAutomaticDimension
        CommentsTable.estimatedRowHeight = 200.0
    }
}

