

import UIKit
import Firebase
import SVProgressHUD
import SDWebImage

class sellerHomeController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    
    @IBOutlet weak var emptyContent: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var productArray:[Product] = []
    var ref : DatabaseReference!
    var cell : productCell!
    var product = [Product]()
    var dataDict : [String : AnyObject]!
    var productTiltle : String!
    var productID : String!
    
    func fetchSellerProduct() {
        let currentUserId = Auth.auth().currentUser?.uid
        self.ref.child("item").observe(.childAdded) { (snapshots:DataSnapshot) in
            if let dectionary = snapshots.value as? [String:AnyObject] {
                print(dectionary)
                self.productID = snapshots.key
                print("**********************************\nprduct id : \(self.productID!)")
                let img = snapshots.childSnapshot(forPath: "itemImages")
                let item = Product(dectionary: dectionary, productID: snapshots.key)
                for count in 0...3 {
                    let image = img.childSnapshot(forPath: "\(count)").value as? String
                    item.imgproduct.append(image!)
                    
                }
                
                
                for count in 0...3 {
                    
                    print("************URL\(count)**************\n\(item.imgproduct[count])")
                }
                
               let sellerId = dectionary["sellerId"] as? String
                print("************Seller ID************* : \n \(sellerId!)")
                
                if currentUserId == sellerId {
                    self.emptyContent.isHidden = true
                    self.product.append(item)
                    
                   
                }
                
                
                print("Number of items inside fetch : \(self.product.count)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emptyContent.isHidden = true
        ref = Database.database().reference()
        fetchSellerProduct()
       // tableView.tableFooterView = UIView()
        SVProgressHUD.dismiss()
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        
        var url = [String]()
        url.append(self.product[indexPath.row].imgproduct[0])
        url.append(self.product[indexPath.row].imgproduct[1])
        url.append(self.product[indexPath.row].imgproduct[2])
        url.append(self.product[indexPath.row].imgproduct[3])
        
        
        for i in 0...3{
            print("************ images urls : \(url[i])")
        }
        
        let imageRef1 = Storage.storage().reference(forURL: url[0])
        
        print("image refrence : \(imageRef1)")
        imageRef1.delete(completion: { (error) in
            if  error != nil  {
                 print(error ?? "No error")
            } else {
                print("File 1 deleted successfuly ^_^")
                print("THE URL 1 : \(url[0])")
            }
        })
        
        
        let imageRef2 = Storage.storage().reference(forURL: url[1])
        
        print("image refrence : \(imageRef2)")
        imageRef2.delete(completion: { (error) in
            if  error != nil  {
                print(error ?? "No error")
            } else {
                print("File 2 deleted successfuly ^_^")
                 print("THE URL 2 : \(url[1])")
                
            }
        })
        
        
        let imageRef3 = Storage.storage().reference(forURL: url[2])
        
        print("image refrence : \(imageRef3)")
        imageRef3.delete(completion: { (error) in
            if  error != nil  {
                 print(error ?? "No error")
            } else {
                print("File 3 deleted successfuly ^_^")
                 print("THE URL 3 : \(url[2])")
            }
        })
        
        
        let imageRef4 = Storage.storage().reference(forURL: url[3])
        
        print("image refrence : \(imageRef4)")
        imageRef4.delete(completion: { (error) in
            if  error != nil {
                 print(error ?? "No error")
            } else {
                print("File 4 deleted successfuly ^_^")
                 print("THE URL 4 : \(url[3])")
            }
        })
        
        
        
        
        
        
        
        let productId = product[indexPath.row].productID
        self.ref.child("item").child(productId!).removeValue { (error, ref) in
            if error != nil {
                print("Faild tp delete the item")
            }
            

            

            

            self.product.remove(at: indexPath.row)
            self.tableView.deleteRows( at: [indexPath] , with: .automatic )
        }
        
        
    }
    
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if product.count == 0 {
            emptyContent.isHidden = false
        }
        
        return product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! productCell
        print("Number of items inside cell for row at: \(self.product.count)")
        
       
        
        cell.productTitle?.text = product[indexPath.row].producttitle
        let statust = product[indexPath.row].status!
        switch statust {
        case "0":
            cell.productDescription?.text = "حالة المنتج : متاح "
            break
        case "1":
            cell.productDescription?.text = "حالة المنتج : تم الطلب "
            break
        case "2":
            cell.productDescription?.text = "حالة المنتج : تم الشحن "
            break
        case "3":
            cell.productDescription?.text = "حالة المنتج : مباعة "
            break
        default:
            break
        }
        
        let url = product[indexPath.row].imgproduct[0]
        //print(url)
        cell.imageCell?.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "noimage"))
        cell.delegate = self
        
//        cell.editeButton.tag = indexPath.row
//        cell.editeButton.addTarget(self , action: #selector(editeProduct) , for: .touchUpInside )
//        
        
       // cell.imageCell.image = UIImage(named: "location")
        
        
        cell.mainBackground.layer.cornerRadius = 10
        cell.mainBackground.layer.masksToBounds = true
        
        cell.shadowBackground.layer.masksToBounds = false
        cell.shadowBackground.layer.shadowOffset = CGSize(width: CGFloat(0), height: CGFloat(3))
        cell.shadowBackground.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.shadowBackground.layer.shadowOpacity = 0.23
        cell.shadowBackground.layer.shadowRadius = 17
        cell.shadowBackground.layer.shadowPath = UIBezierPath(roundedRect: cell.shadowBackground.bounds, byRoundingCorners: .allCorners , cornerRadii: CGSize(width: 8, height: 8)).cgPath
        
        cell.shadowBackground.layer.shouldRasterize = true
        cell.shadowBackground.layer.rasterizationScale = UIScreen.main.scale
        cell.selectionStyle = .none
        return cell
    }
    
//    @IBAction func editeProduct(sender : UIButton){
//
//        let titleString = self.product.inde
//    }
//
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//         self.performSegue(withIdentifier: "showEditing", sender: self)
//    }

   
}
extension sellerHomeController : productCellProtocol {

    func editButtonSelected(title: String) {
        let alertTitle = "Edite Title"
        let message = "\(title) , will be edited"

        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        present(alert , animated: true , completion: nil )
    }
}
