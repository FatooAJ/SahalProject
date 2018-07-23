//
//  ProductDetilesViewController.swift
//  sahal
//
//  Created by Fatima Aljaber on 16/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit

class ProductDetilesViewController: UIViewController ,
UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource {
    
    
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
    // var comments = ["I want to buy it","Do not buy it","Shiiiit ","What this????","answer me","I want to buy it"]
    // var username = ["Ahmed","Mohammed","Jehad","Ahmed","Mohammed","Jehad"]
    var images: [String] = ["1.jpeg","2.jpeg","3.jpg","4.jpg","5.jpg"]
    var frame = CGRect(x:0,y:0,width:0,height:0)
    var count: Int = 0
    
    
    // image Scroll Func
    func ProductImageScroll(){
        imagecontrol.numberOfPages = images.count
        // Do any additional setup after loading the view.
        for index in 0..<images.count {
            frame.origin.x = imagescrol.frame.size.width * CGFloat(index)
            frame.size = imagescrol.frame.size
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: images[index])
            self.imagescrol.addSubview(imgView)
        }
        imagescrol.contentSize = CGSize(width:(imagescrol.frame.size.width * CGFloat(images.count)), height: imagescrol.frame.size.height)
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
        count = count + 1
        CommentsTable.reloadData()
        scroll.contentSize.height = 650 + CommentsTable.contentSize.height
        //CommentsTable.frame.size.height = CommentsTable.contentSize.height+50
        // CommentsTable.maxHeight = CommentsTable.contentSize.height
        print(CommentsTable.contentSize.height)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tableView.frame.size = tableView.contentSize
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentcell", for: indexPath) as! CommentsTableViewCell
        //let user = username[indexPath.row]
        //let comment = comments[indexPath.row]
        let tt1 =  Textcomments.text!
        cell.commentText?.text = tt1
        //   cell.commentText?.text = comment
        cell.Username?.text = "User name  \([indexPath.row+1])"
        
        // cell.commentText?.text = "name \([indexPath.row+1])"
        //Tabel cell Style
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.shouldRasterize = true
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Tags Style
        scroll.contentSize.height = 300
        companyname.applyDesign()
        Years.applyDesign()
        carname.applyDesign()
        cartype.applyDesign()
        piece.applyDesign()
        //call image function
        ProductImageScroll()
    }
    
}

extension UILabel {
    func applyDesign() {
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 1.50
        //self.layer.shadowColor = UIColor.black.cgColor
        //self.layer.shadowRadius = 3
        //self.layer.shadowOpacity = 0.5
        //self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
