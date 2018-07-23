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
        self.layer.cornerRadius = 7
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor(red: 99/255, green: 187/255, blue: 190/255, alpha: 1)
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
