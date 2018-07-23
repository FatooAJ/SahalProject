//
//  ooerationCell.swift
//  sahal
//
//  Created by Ghufran nour  on 09/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit

class ooerationCell: UITableViewCell {

    @IBOutlet weak var operationImg: UIImageView!
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
