//
//  MyorderTableViewCell.swift
//  sahal
//
//  Created by Fatima Aljaber on 22/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit

class MyorderTableViewCell: UITableViewCell {

    @IBOutlet var shadowLayer: UIView!
    @IBOutlet var mainBackground: UIView!
    @IBOutlet var OrderStatus: UILabel!
    
    @IBOutlet var productimg: UIImageView!
    @IBOutlet var Company: UILabel!
    @IBOutlet var Title: UILabel!
  
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

override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
}

override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
}

}
