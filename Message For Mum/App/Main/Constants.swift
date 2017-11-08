//
//  Constants.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 27/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import UIKit
import CoreData

// MARK: - General app-wide constants

public enum MMApp {
    
    static var appDelegate: AppDelegate {
        return AppDelegate.shared!
    }
    
    static let screenSize: CGSize = UIScreen.main.bounds.size
    
    static let year: Int = 2018
}

// MARK: - Colors

public enum MMColor {
    static let black = UIColor(red256: 120, green256: 120, blue256: 120)
    static let darkGray = UIColor(red256: 140, green256: 140, blue256: 140)
    static let lightGray = UIColor(red256: 200, green256: 200, blue256: 200)
    static let pink = UIColor(red256: 255, green256: 96, blue256: 118, alpha: 0.4)
    static let selectionGray = UIColor.black.withAlphaComponent(0.1)
}

// MARK: - Padding

enum MMPadding {
    static let tiny: CGFloat = 8.0
    static let small: CGFloat = 10.0
    static let medium: CGFloat = 15.0
    static let large: CGFloat = 20.0
    static let grand: CGFloat = 30.0
}

// MARK: - Fonts

enum MMFont: String {
    
    case helveticaNeueBold = "HelveticaNeue-Bold"
    case helveticaNeueMedium = "HelveticaNeue-Medium"
    case helveticaNeueLight = "HelveticaNeue-Light"
    
    // Create a `UIFont` instance with the given font size
    func withSize(_ size: CGFloat) -> UIFont {
        let result: UIFont? = UIFont(name: self.rawValue, size: size)
        assert(result != nil, "Font \(self.rawValue) does not exist")
        if let result: UIFont = result {
            return result
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
