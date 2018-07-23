//
//  SearchResultCollectionViewCell.swift
//  sahal
//
//  Created by Fatima Aljaber on 21/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet var shadowLayer: UIView!
    @IBOutlet var mainBackground: UIView!
    @IBOutlet var locationicon: UIImageView!
    
    @IBOutlet var ShoppingIcon: UIImageView!
    @IBOutlet var price: UILabel!
    @IBOutlet var titleproduct: UILabel!
    @IBOutlet var sellername: UILabel!
    @IBOutlet var productimage: UIImageView!
    @IBOutlet var city: UILabel!
    
    class ShadowView: UIView {
        override var bounds: CGRect {
            didSet {
                setupShadow()
            }
        }
        
        private func setupShadow() {
            self.layer.cornerRadius = 8
            self.layer.shadowOffset = CGSize(width: 0, height: 3)
            self.layer.shadowRadius = 3
            //  self.layer.shadowColor = UIColor.red.cgColor
            self.layer.shadowOpacity = 0.3
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.main.scale
        }
    }
}
