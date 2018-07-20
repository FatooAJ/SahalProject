//
//  CustomSerachButton.swift
//  sahal
//
//  Created by Fatima Aljaber on 17/07/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit

class CustomSerachButton: UIButton {

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        //  self.backgroundColor = UIColor.gray
        self.tintColor = UIColor.white
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
