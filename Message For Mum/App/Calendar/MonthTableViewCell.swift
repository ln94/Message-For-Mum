//
//  MonthTableViewCell.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 30/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

public protocol MonthTableViewCellDelegate {
    func didTapOnDate(_ date: Date, completion: @escaping ()->())
}

class MonthTableViewCell: UITableViewCell, DayLabelProtocol {

    // MARK: - Views
    
    private let titleLabel: UILabel = UILabel()
    
    private var weekViews: [TransparentView] = []
    private var dayLabels: [DayLabel] = []
    
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
        let labelWidth: CGFloat = (MMApp.screenSize.width - 2 * MMPadding.small) / CGFloat(MMWeekday.count.rawValue)
        for _: Int in 0..<6 {
            // Week view
            let weekView: TransparentView = TransparentView(superview: contentView)
            weekView.alignTo(edge: .top, length: MMPadding.grand, insets: UIEdgeInsets(top: weekViewY, left: MMPadding.small, right: MMPadding.small))
            weekViews.append(weekView)
            weekViewY += weekView.height + MMPadding.small
            
            // Labels
            for i: Int in 0..<MMWeekday.count.rawValue {
                let dayLabel: DayLabel = DayLabel(superview: weekView)
                dayLabel.alignTo(edge: .left, length: labelWidth, insets: UIEdgeInsets(left: CGFloat(i) * labelWidth))
                dayLabel.delegate = self
                dayLabels.append(dayLabel)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    public var month: MMMonth = .count {
        didSet {
            // Month title
            titleLabel.attributedText = month.title()?.uppercased().withSpacing(letter: 2.0, alignment: .center)
            
            // Show / hide week views
            for i: Int in 0..<weekViews.count {
                weekViews[i].alpha = i < month.numberOfWeeks ? 1.0 : 0.0
            }
            
            // Set day numbers
            var day: Int = 1
            for i: Int in 0..<dayLabels.count {
                if month == .february && day == 26 {
                    print()
                }
                if i < month.firstDayWeekday.rawValue || day > month.numberOfDays {
                    dayLabels[i].number = nil
                    dayLabels[i].isToday = false
                }
                else {
                    dayLabels[i].number = day
                    dayLabels[i].isToday = Date().month == month.rawValue + 1 && Date().day == day //&& Date().year == MMApp.year
                    day += 1
                }
            }
        }
    }
    
    public var delegate: MonthTableViewCellDelegate?
    
    // MARK: - Calculate height
    
    class func height(for month: MMMonth) -> CGFloat {
        return MMPadding.grand + 13.0 + 2 * MMPadding.medium + CGFloat(month.numberOfWeeks) * MMPadding.grand + CGFloat(month.numberOfWeeks - 1) * MMPadding.small
    }
    
    // MARK: - DayLabelProtocol
    
    func didTapOnDayLabel(_ dayLabel: DayLabel, completion: @escaping () -> ()) {
        if let day: Int = dayLabel.number {
            delegate?.didTapOnDate(Date(day: day, month: month.rawValue + 1, year: MMApp.year), completion: completion)
        }
    }
    
}
