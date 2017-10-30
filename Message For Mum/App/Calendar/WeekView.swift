//
//  WeekView.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 30/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class WeekView: TransparentView {

    // MARK: - Views
    
    private var labels: [UILabel] = []
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: MMPadding.small,
                                 y: 0.0,
                                 width: MMApp.screenSize.width - 2 * MMPadding.small,
                                 height: MMPadding.grand))
        
        
        // Labels
        let labelWidth: CGFloat = width / 7
        for i: Int in 0..<MMWeekday.count.rawValue {
            let label: UILabel = UILabel(superview: self)
            label.alignTo(edge: .left, length: labelWidth, insets: UIEdgeInsets(left: CGFloat(i) * labelWidth))
            label.font = MMFont.helveticaNeueMedium.withSize(15.0)
            label.textColor = MMColor.black
            label.textAlignment = .center
            labels.append(label)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    public var numbers: [Int] = [] {
        didSet {
            for i: Int in 0..<MMWeekday.count.rawValue {
                labels[i].text = numbers[i] > 0 ? String(format: "%i", numbers[i]) : nil
            }
        }
    }

}
