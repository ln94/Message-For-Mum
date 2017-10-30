//
//  MonthTableViewCell.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 30/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class MonthTableViewCell: UITableViewCell {

    // MARK: - Views
    
    private let titleLabel: UILabel = UILabel()
    
    private var weekViews: [WeekView] = []
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        // Title
        contentView.addSubview(titleLabel)
        titleLabel.alignTo(edge: .top, length: 12.0, insets: UIEdgeInsets(top: MMPadding.grand))
        titleLabel.applyStyle(.mediumTitle)
        
        // Dividing line
        let separator: UIView = UIView(superview: contentView)
        separator.alignTo(edge: .top, length: 1.0, insets: UIEdgeInsets(top: titleLabel.bottom + MMPadding.medium, left: 50.0, right: 50.0))
        separator.backgroundColor = .white
        separator.addShadow(color: .white, radius: 4.0)
        
        // Week views
        var weekViewY: CGFloat = separator.bottom + MMPadding.medium
        for _: Int in 0..<6 {
            let weekView: WeekView = WeekView(superview: contentView)
            weekView.y = weekViewY
            weekViewY += weekView.height + MMPadding.small
            weekViews.append(weekView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set month
    
    public var month: MMMonth = .count {
        didSet {
            titleLabel.attributedText = month.title()?.uppercased().withSpacing(letter: 2.0, alignment: .center)
            
            // First week
            var day: Int = 1
            var numbers: [Int] = []
            for i: Int in 0..<MMWeekday.count.rawValue {
                if i < month.firstDayWeekday.rawValue {
                    numbers.append(0)
                }
                else {
                    numbers.append(day)
                    day += 1
                }
            }
            weekViews[0].numbers = numbers

            // Next weeks
            var week: Int = 1
            while day <= month.numberOfDays {
                numbers = []
                for _: Int in 0..<MMWeekday.count.rawValue {
                    numbers.append(day <= month.numberOfDays ? day : 0)
                    day += 1
                }
                weekViews[week].numbers = numbers
                week += 1
            }

            // Hide remaining weeks
            for i: Int in 0..<weekViews.count {
                weekViews[i].alpha = i < week ? 1.0 : 0.0
            }
        }
    }
    
    // MARK: - Calculate height
    
    class func height(for month: MMMonth) -> CGFloat {
        let h = MMPadding.grand + 13.0 + 2 * MMPadding.medium + CGFloat(month.numberOfWeeks) * MMPadding.grand + CGFloat(month.numberOfWeeks - 1) * MMPadding.small
        return h
    }
}
