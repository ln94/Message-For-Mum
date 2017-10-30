//
//  UIEdgeInsets+L.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 29/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import UIKit

public extension UIEdgeInsets {
    
    init(top: CGFloat = 0.0, left: CGFloat = 0.0, bottom: CGFloat = 0.0, right: CGFloat = 0.0) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
}

public enum UIEdge {
    case top
    case right
    case bottom
    case left
}

public enum UICorner {
    case topLeft
    case topRight
    case bottomRight
    case bottomLeft
}
