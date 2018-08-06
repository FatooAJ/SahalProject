import UIKit
import Firebase
import FirebaseStorage
import SVProgressHUD
import SDWebImage

class OperationController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet var operationTable: UITableView!
    var newOperation:[Operation] = []
    var oldOperation:[Operation] = []
    var ref : DatabaseReference!
    var cell : operationCell!
    var itemName : String!
    var productID : String!
    var operation : Operation!
    
    
    
    var itemId : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        fetchOrder(){ newOperation , oldOperation in
            self.operationTable.reloadData()
        }
        print("************ New Operation : \n \(self.newOperation) ")
        print("************ Old Operation : \n \(self.oldOperation) ")
    }
    
    @IBAction func switchSegment(_ sender: UISegmentedControl) {
        switch segmentOutlet.selectedSegmentIndex{
        case 0 :
            operationTable.reloadData()
        case 1 :
            operationTable.reloadData()
        default:
            break
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.operationTable.reloadData()
    }
    
    func fetchOrder(completed: @escaping ((_ newOperation: [Operation] , _ oldOperation:[Operation]) -> ())) {
        let currentUserId = Auth.auth().currentUser?.uid
        var sellerId : String!
        var buyerId : String!
        var itemName : String!
        var address : String!
        var status : String!
        var buyerMobile : String!
        var buyerName : String!
       // var operation : Operation!
        var img : String!
        
        sellerId = currentUserId
        
        var id : String!
        self.ref.child("seller").child(currentUserId!).child("order").observe(.childAdded) { (snapshots : DataSnapshot) in
           id = snapshots.key
            
            self.ref.child("items").child(id).observe(.value , with: { (snapshot : DataSnapshot) in
                if let dectionary = snapshot.value as? [String:AnyObject] {
                    print("item dectionary : \(dectionary)")
                    let item = Product(dectionary: dectionary, productID: snapshots.key)
                    
                    buyerId = item.buyerID
                    itemName = item.producttitle
                    img = snapshot.childSnapshot(forPath: "itemImages").childSnapshot(forPath: "0").value as? String
                    item.imgproduct.append(img)
                    status = item.status
                    
                    
                    self.ref.child("buyer").child(buyerId).observe( .value, with: { (snapshot : DataSnapshot) in
                        
                        
                        
                        if let dectionary = snapshot.value as? [String:AnyObject] {
                            // print("buyer dectionary : \(dectionary)")
                            buyerMobile = dectionary["number"] as? String
                            address = dectionary["city"] as? String
                            buyerName = dectionary["name"] as? String
                            
                            self.operation = Operation(itemid: id,sellerId: sellerId, buyerId: buyerId, itemName: itemName , address: address, statues: status , mobile: buyerMobile, buyerName: buyerName, img: img)
                            
                            
                            if status == "1" || status == "2" {
                                self.newOperation.append(self.operation)
                                print("new item is added")
                               
                            } else if status == "3"{
                                self.oldOperation.append(self.operation)
                                 print("old item is added")
                            }
                            
                        }
                    })
                    
                    
                }
            })
            
            
        }
        
     
        
        
        completed(newOperation , oldOperation)
        
    }
    
    
    
    @IBAction func operationSegment(_ sender: UISegmentedControl) {
        operationTable.reloadData()
    }
    

    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var num = 0
        switch segmentOutlet.selectedSegmentIndex
        {
        case 0:
            num = oldOperation.count
        case 1:
            num = newOperation.count
        default:
            break;
        }
      return num
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! operationCell
        
        
        
        switch segmentOutlet.selectedSegmentIndex
        {
        case 0:
            cell.itemName.text = oldOperation[indexPath.row].itemName
            if oldOperation[indexPath.row].status == "3" {
                cell.orderStatus.text = "مباعة"
                cell.sellingButton.isHidden = true
                cell.shippingButton.isHidden = true
                
            }
            
            cell.buyerName.text = oldOperation[indexPath.row].buyerName
            cell.address.text = oldOperation[indexPath.row].address
            cell.buyerMobile.text = oldOperation[indexPath.row].buyerMobile
            let url = oldOperation[indexPath.row].img
            //print(url)
            cell.operationImg?.sd_setImage(with: URL(string: url!), placeholderImage: UIImage(named: "noimage"))
            cell.setOperation(operation: self.operation)
cell.delgate = self
            return cell
        case 1:
            cell.itemName.text = newOperation[indexPath.row].itemName
            if newOperation[indexPath.row].status == "1" {
                cell.orderStatus.text = "محجوزة"
                cell.sellingButton.isHidden = true
                
            } else  if newOperation[indexPath.row].status == "2" {
                 cell.orderStatus.text = "تم الشحن"
                cell.shippingButton.isHidden = true
            }
            print("here I am\(cell.itemName.text)")
            cell.buyerName.text = newOperation[indexPath.row].buyerName
            cell.address.text = newOperation[indexPath.row].address
            cell.buyerMobile.text = newOperation[indexPath.row].buyerMobile
            let url = newOperation[indexPath.row].img
            //print(url)
            cell.operationImg?.sd_setImage(with: URL(string: url!), placeholderImage: UIImage(named: "noimage"))
            cell.setOperation(operation: self.operation)
            cell.delgate = self
            return cell
        
        default:
            break;
        }
        
        
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
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension OperationController : OperationCellDelaget {
    func tapSellingButton(id: String) {
        self.ref.child("items").child(id).updateChildValues(["status" : "2"])
        
    }
    
    func tapShippingButton(id: String) {
         self.ref.child("items").child(id).updateChildValues(["status" : "3"])
        
    }
    
    
    
    
    
}
