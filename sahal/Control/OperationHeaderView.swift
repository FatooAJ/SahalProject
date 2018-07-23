//
//  OperationHeaderView.swift
//  sahal
//
//  Created by Ghufran nour  on 08/11/1439 AH.
//  Copyright © 1439 wadimakkah. All rights reserved.
//

import UIKit

protocol HeaderDelegate {
    func callHeader(index : Int)
    
}
class OperationHeaderView: UIView {
    
    var secondIndex : Int?
    var delegate : HeaderDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var btn : UIButton = {
        let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y , width: self.frame.width , height: self.frame.height ))
        btn.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        btn.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(onClickHeaderView) , for: .touchUpInside)
        return btn
    }()
    
    @objc func onClickHeaderView (){
        
        if let index = secondIndex {
            delegate?.callHeader(index: index)
        }
        
    }
}
