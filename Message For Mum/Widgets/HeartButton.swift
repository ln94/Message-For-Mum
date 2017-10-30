//
//  HeartButton.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 29/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class HeartButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(#imageLiteral(resourceName: "Heart Icon"), for: .normal)
        setImage(#imageLiteral(resourceName: "Heart Icon Filled"), for: .selected)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
