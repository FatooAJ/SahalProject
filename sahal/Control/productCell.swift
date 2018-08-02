//
//  productCell.swift
//  sahal
//
//  Created by Ghufran nour  on 05/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit

protocol productCellProtocol {
    func editButtonSelected(title : String )
}

class productCell: UITableViewCell {
    
    var productItem : Product!
    var delegate : productCellProtocol?

    @IBOutlet weak var mainBackground: UIView!
    @IBOutlet weak var shadowBackground: UIView!
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var editeButton: CustomSerachButton!
    
    
    
    func setProduct (product : Product) {
        //imageCell.image = UIImageView(named: product.img )
        imageCell.image = UIImage(named: product.img)
        productTitle?.text = product.title
        productDescription.text = product.description
      //  UIImageView(named: "" )
    }
    
    
    class ShadowView: UIView {
        override var bounds: CGRect {
            didSet {
                setupShadow()
            }
        }
        
        private func setupShadow() {
            self.layer.cornerRadius = 12
            self.layer.shadowOffset = CGSize(width: 0, height: 3)
            self.layer.shadowRadius = 3
            //  self.layer.shadowColor = UIColor.red.cgColor
            self.layer.shadowOpacity = 0.3
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.main.scale
        }
    }
    
    
    @IBAction func editeButton(_ sender: CustomSerachButton) {
        delegate?.editButtonSelected(title: "Hi" )
    }
    
    
}
