//
//  NSAttributedString+L.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 29/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    func withSpacing(letter: CGFloat = 0.0, line: CGFloat = 0.0, alignment: NSTextAlignment = .left) -> NSAttributedString {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = line
        paragraphStyle.alignment = alignment
        return NSAttributedString(string: self, attributes: [.kern : letter, .paragraphStyle: paragraphStyle])
    }
}

public extension NSAttributedString {
    func withSpacing(letter: CGFloat = 0.0, line: CGFloat = 0.0) -> NSAttributedString {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = line
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(attributedString: self)
        attributedString.addAttributes([.kern : letter, .paragraphStyle: paragraphStyle], range: NSMakeRange(0, attributedString.length))
        return attributedString
    }
}
