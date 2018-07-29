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
    var ALLCOMMENTS = [Comments]()
   
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
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        showProductDetail()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Tags Style
        scroll.contentSize.height = 300
        companyname.applyDesign()
        Years.applyDesign()
        carname.applyDesign()
        cartype.applyDesign()
        piece.applyDesign()
        configureTabelView()
        //call image function
        
        databaseReference = Database.database().reference()
        DispatchQueue.main.async {
            self.settinguplabels()
        }
        showProductDetail()
        //retriveimg()
        CommentsTable.reloadData()
        //bProductImageScroll()
        loadMessages()
        
      //  showProductDetail()
     //   settinguplabels()
        
        
    }

    
    func showProductDetail(){
       
        //print(self.companyname)
      //  print("here\(self.productID!)")
        databaseReference = Database.database().reference().child("items").child(self.productID!)
        databaseReference.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? [String: AnyObject]
           // print(value)
            let title = value?["name"] as? String?
          //  print(title)
            var arrayimage = [String]()
            for index in 0...3{
                let img = snapshot.childSnapshot(forPath: "itemImages").childSnapshot(forPath: "\(index)").value as? String
                
                arrayimage.append(img!)
            }
            self.ProductImageScroll(Arrayimage: arrayimage)
            //print("!!!!!\(arrayimage)")
      //ProductImageScroll(Arrayimage: [String])
            
        })
        
        databaseReference.observe(.value, with: { (snapshots:DataSnapshot) in
            var PRODUCT = Product()
            //print(snapshots.value as? [String:AnyObject])
            if let dectionary = snapshots.value as? [String:AnyObject] {
             //   print(dectionary)
                let productOBJ = Product(dectionary: dectionary, productID: snapshots.key)
                PRODUCT = productOBJ
            }
            self.PRODUCT = PRODUCT
           
        })
    }
//    func retriveimg(){
//        databaseReference = Database.database().reference()
//        databaseReference.child("items").observe(.childAdded) { (snapshots:DataSnapshot) in
//            if let dectionary = snapshots.value as? [String:AnyObject] {
//                let img = snapshots.childSnapshot(forPath: "itemImages")
//                let item = Product(dectionary: dectionary, productID: snapshots.key)
//                //   print(ite)
//                for count in 0...3 {
//                    //      print(count)
//                    let image = img.childSnapshot(forPath: "\(count)").value as? String
//                    // self.imageURLs.append(image!)
//                    item.imgproduct.append(image!)
//                    print(self.PRODUCT.imgproduct)
//                }
//
//            }
//        }
//    }
    
    // image Scroll Func
    func ProductImageScroll(Arrayimage: [String]){
        
        imagecontrol.numberOfPages = Arrayimage.count
        // Do any additional setup after loading the view.
       // let image = PRODUCT.imgproduct[]
        for index in 0...3 {
          //  print("here hrer !!\(Arrayimage[index])")
            frame.origin.x = imagescrol.frame.size.width * CGFloat(index)
            frame.size = imagescrol.frame.size
            let imgView = UIImageView(frame: frame)
            let url = Arrayimage[index]
            imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "noimage"))
          //  imgView.image = UIImage(named: images[index])
            self.imagescrol.addSubview(imgView)
        }
        imagescrol.contentSize = CGSize(width:(imagescrol.frame.size.width * CGFloat(Arrayimage.count)), height: imagescrol.frame.size.height)
        imagescrol.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

        TitleProduct.text = self.PRODUCT.producttitle
        Description.text = self.PRODUCT.productdescription
        Price.text = self.PRODUCT.Price + " ريال"
        City.text = self.PRODUCT.City
       // self.City.text = value?["city"] as? String
        
        //tags
        companyname.text = self.PRODUCT.Companyname
        Years.text = self.PRODUCT.year
        carname.text = self.PRODUCT.carname
       // self.carname.text = values?["carName"] as? String
        cartype.text = self.PRODUCT.type
        //  self.piece.text = value?["factoryName"] as? String
        print(self.PRODUCT.imgproduct)
        print(self.PRODUCT.year)
        
        
        
        
    }

    func configureTabelView() {
        CommentsTable.rowHeight = UITableViewAutomaticDimension
        CommentsTable.estimatedRowHeight = 200.0
    }
}

extension UILabel {
    func applyDesign() {
        //self.layer.borderColor = UIColor.gray.cgColor
        //self.layer.borderWidth = 1.0;
       // self.layer.cornerRadius = 1.50
        //self.layer.shadowColor = UIColor.black.cgColor
        //self.layer.shadowRadius = 3
        //self.layer.shadowOpacity = 0.5
        //self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
