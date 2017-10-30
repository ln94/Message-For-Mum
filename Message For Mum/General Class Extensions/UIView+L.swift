//
//  UIView+L.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 28/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import UIKit

// ----------------------
//
// MARK: - Shadow
//
// ----------------------

public extension UIView {
    func addShadow(color: UIColor, offset: CGPoint = CGPoint.zero, radius: CGFloat, opacity: CGFloat = 1.0) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: offset.x, height: offset.y)
        layer.shadowRadius = radius
        layer.shadowOpacity = Float(opacity)
    }
}



// ----------------------
//
// MARK: - Init
//
// ----------------------

public extension UIView {
    convenience init(superview: UIView) {
        self.init()
        superview.addSubview(self)
    }
    
    convenience init(size: CGSize) {
        self.init(frame: CGRect(origin: CGPoint.zero, size: size))
    }
}



// ----------------------
//
// MARK: - Properties
//
// ----------------------

public extension UIView {
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var right: CGFloat {
        return x + width
    }
    
    var bottom: CGFloat {
        return y + height
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var size: CGSize {
        get {
            return CGSize(width: self.width, height: self.height)
        }
        set {
            self.frame.size = newValue
        }
    }
}



// ----------------------
//
// MARK: - Positioning
//
// ----------------------

public extension UIView {
    
    func fill(insets: UIEdgeInsets = .zero) {
        guard let superview = self.superview else {
            return
        }
        
        let autoresizingMask: UIViewAutoresizing = [.flexibleWidth, .flexibleHeight]
        if self.autoresizingMask != autoresizingMask {
            self.autoresizingMask = autoresizingMask
        }
        
        let frame: CGRect = CGRect(x: insets.left,
                                   y: insets.top,
                                   width: superview.width - insets.left - insets.right,
                                   height: superview.height - insets.top - insets.bottom)
        if !self.frame.equalTo(frame) {
            self.frame = frame
        }
    }
    
    func alignTo(edge: UIEdge, length: CGFloat, insets: UIEdgeInsets = .zero) {
        guard let superview = self.superview else {
            return
        }
        
        let autoresizingMask: UIViewAutoresizing
        let frame: CGRect
        
        switch edge {
        case .left:
            autoresizingMask = [.flexibleRightMargin, .flexibleHeight]
            frame = CGRect(x: insets.left,
                           y: insets.top,
                           width: length,
                           height: superview.height - insets.top - insets.bottom)
        case .right:
            autoresizingMask = [.flexibleLeftMargin, .flexibleHeight]
            frame = CGRect(x: superview.width - length - insets.right,
                           y: insets.top,
                           width: length,
                           height: superview.height - insets.top - insets.bottom)
            
        case .top:
            autoresizingMask = [.flexibleBottomMargin, .flexibleWidth]
            frame = CGRect(x: insets.left,
                           y: insets.top,
                           width: superview.width - insets.left - insets.right,
                           height: length)
            
        case .bottom:
            autoresizingMask = [.flexibleTopMargin, .flexibleWidth]
            frame = CGRect(x: insets.left,
                           y: superview.height - length - insets.bottom,
                           width: superview.width - insets.left - insets.right,
                           height: length)
        }
        
        if self.autoresizingMask != autoresizingMask {
            self.autoresizingMask = autoresizingMask
        }
        
        if !self.frame.equalTo(frame) {
            self.frame = frame
        }
    }
    
    func alignTo(corner: UICorner, size: CGSize, offset: CGPoint = .zero) {
        guard let superview = self.superview else {
            return
        }
        
        let autoresizingMask: UIViewAutoresizing
        let frame: CGRect
        
        switch corner {
        case .topLeft:
            autoresizingMask = [.flexibleRightMargin, .flexibleBottomMargin]
            frame = CGRect(origin: CGPoint(x: offset.x,
                                           y: offset.y),
                           size: size)
            
        case .topRight:
            autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
            frame = CGRect(origin: CGPoint(x: superview.width - offset.x - size.width,
                                           y: offset.y),
                           size: size)
            
        case .bottomLeft:
            autoresizingMask = [.flexibleRightMargin, .flexibleTopMargin]
            frame = CGRect(origin: CGPoint(x: offset.x,
                                           y: superview.height - offset.y - size.height),
                           size: size)
            
        case .bottomRight:
            autoresizingMask = [.flexibleLeftMargin, .flexibleTopMargin]
            frame = CGRect(origin: CGPoint(x: superview.width - offset.x - size.width,
                                           y: superview.height - offset.y - size.height),
                           size: size)
        }
        
        if self.autoresizingMask != autoresizingMask {
            self.autoresizingMask = autoresizingMask
        }
        
        if !self.frame.equalTo(frame) {
            self.frame = frame
        }
    }
}
