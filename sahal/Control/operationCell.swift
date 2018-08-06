//
//  ooerationCell.swift
//  sahal
//
//  Created by Ghufran nour  on 09/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit

protocol OperationCellDelaget {
    func tapSellingButton(id:String)
    func tapShippingButton(id:String)
}

class operationCell: UITableViewCell {
    
    
    var operation : Operation!
    var delgate : OperationCellDelaget?
    
    func setOperation(operation : Operation)  {
        self.operation = operation
    }

    @IBOutlet weak var shadowBackground : UIView!
    @IBOutlet weak var operationImg: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var buyerName: UILabel!
    @IBOutlet weak var buyerMobile: UILabel!
    
    @IBOutlet weak var mainBackground: UIView!
    
    
    @IBOutlet weak var shippingButton: UIButton!
    @IBOutlet weak var sellingButton: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func shippingAction(_ sender: UIButton) {
        delgate?.tapShippingButton(id: operation.itemId)
    }
    
    @IBAction func sellingAction(_ sender: UIButton) {
        delgate?.tapSellingButton(id: operation.itemId)
    }
    
    
    
}
