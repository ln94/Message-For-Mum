//
//  UIView+MM.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 30/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

public extension UIView {
    
    func addBarShadow(bottom: Bool = true) {
        addShadow(color: .white, offset: CGPoint(x: 0.0, y: bottom ? 0.0 : 2.0), radius: 2.0, opacity: 0.8)
    }
    
    func addTextShadow(color: UIColor) {
        addShadow(color: color, offset: CGPoint(x: 0.0, y: 2.0), radius: 4.0, opacity: 0.65)
    }
}
