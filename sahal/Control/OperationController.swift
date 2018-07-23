//
//  OperationController.swift
//  sahal
//
//  Created by Ghufran nour  on 09/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit

class OperationController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet var operationTable: UITableView!
    @IBAction func operationSegment(_ sender: UISegmentedControl) {
        operationTable.reloadData()
    }
    
    var productimg = ["1.jpeg","2.jpeg","3.jpg","4.jpg","5.jpg","3.jpg","4.jpg"]
    
    var orderNumber = ["12345" , "14376" , "12345" ]
    
    var orderStatuse1 = ["طلب جديد" , "طلب جديد" , "طلب جديد" ]
    
    var orderStatuse2 = ["تم التسليم" , "جاري الشحن" , "تم تأكيد الطلب"]
    
    var date = ["10/2/2018" , "10/2/2018" , "10/2/2018"]

    

    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch changesegment.selectedSegmentIndex
//        {
//        case 0:
//            return titleOfproduct.count
//        case 1:
//            return titleOfproduct.count
//        case 2:
//            return titleOfproduct.count
//        case 3:
//            return titleOfproduct.count
//        default:
//            break;
//        }
//
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! ooerationCell

         let img = productimg[indexPath.row]
        
        
        
        switch segmentOutlet.selectedSegmentIndex
        {
        case 0:
            cell.operationImg?.image = UIImage(named: img)

        case 1:
            cell.operationImg?.image = UIImage(named: img)
        
        default:
            break;
        }
        
        
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    

    
}
