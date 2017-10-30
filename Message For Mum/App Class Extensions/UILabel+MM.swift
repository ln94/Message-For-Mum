//
//  UILabel+MM.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 29/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

public enum MMTextStyle {
    case largeTitle
    case mediumTitle
    case smallTitle
    case messageTitle
    case messageText
}

public extension UILabel {
    func applyStyle(_ style: MMTextStyle) {
        // Font
        switch style {
        case .largeTitle:
            font = MMFont.helveticaNeueMedium.withSize(20.0)
        case .mediumTitle:
            font = MMFont.helveticaNeueMedium.withSize(10.0)
        case .smallTitle:
            font = MMFont.helveticaNeueLight.withSize(12.0)
        case .messageTitle:
            font = MMFont.helveticaNeueBold.withSize(15.0)
        case .messageText:
            font = MMFont.helveticaNeueLight.withSize(12.0)
        }
        
        // Other parameters
        switch style {
        case .largeTitle, .mediumTitle, .smallTitle:
            textColor = .white
            textAlignment = .center
            addShadow(color: .white, offset: CGPoint(x: 0.0, y: 2.0), radius: 4.0, opacity: 0.65)
            
        case .messageTitle, .messageText:
            textColor = MMColor.black
            textAlignment = style == .messageTitle ? .center : .justified
            addShadow(color: MMColor.black, offset: CGPoint(x: 0.0, y: 2.0), radius: 4.0, opacity: 0.65)
            numberOfLines = 0
        }
    }
    
}
