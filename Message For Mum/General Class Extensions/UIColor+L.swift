//
//  UIColor+L.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 28/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {

    // MARK: - Initialize using 0-255 RGBA values
    
    convenience init(red256: UInt8, green256: UInt8, blue256: UInt8, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red256) / 255.0,
                  green: CGFloat(green256) / 255.0,
                  blue: CGFloat(blue256) / 255.0,
                  alpha: alpha)
    }

}
