//
//  productCell.swift
//  sahal
//
//  Created by Ghufran nour  on 05/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit

class productCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    func setProduct (product : Product) {
        //imageCell.image = UIImageView(named: product.img )
        imageCell.image = UIImage(named: product.img)
        productTitle?.text = product.title
        productDescription.text = product.description
      //  UIImageView(named: "" )
    }
}
