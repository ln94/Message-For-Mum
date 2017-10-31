//
//  DayLabel.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 31/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

public protocol DayLabelProtocol {
    
    func didTapOnDayLabel(_ dayLabel: DayLabel, completion: @escaping ()->())
}

public class DayLabel: UIView {

    // MARK: - Properties
    
    public var delegate: DayLabelProtocol?
    
    public var number: Int? {
        didSet {
            label.text = number != nil ? String(number!) : nil
        }
    }
    
    public var isSelected: Bool = false {
        didSet {
            selectionCircle.alpha = isSelected ? 1.0 : 0.0
            label.textColor = isSelected ? .white : MMColor.black
        }
    }
    
    public var isToday: Bool = false {
        didSet {
            todayCircle.alpha = isToday ? 1.0 : 0.0
            label.textColor = isToday ? .white : MMColor.black
        }
    }
    
    // MARK: - Views
    
    private let label: UILabel = UILabel()
    private let selectionCircle: UIView = UIView()
    private let todayCircle: UIView = UIView()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let circleWidth: CGFloat = 26.0
        let circleSize: CGSize = CGSize(width: circleWidth, height: circleWidth)
        
        // Selection circle
        addSubview(selectionCircle)
        selectionCircle.alignToCenter(size: circleSize)
        selectionCircle.layer.cornerRadius = circleSize.width / 2
        selectionCircle.backgroundColor = MMColor.selectionGray
        selectionCircle.alpha = 0.0
        
        // Today circle
        addSubview(todayCircle)
        todayCircle.alignToCenter(size: circleSize)
        todayCircle.layer.cornerRadius = circleSize.width / 2
        todayCircle.backgroundColor = MMColor.pink
        todayCircle.alpha = 0.0
        
        // Number label
        addSubview(label)
        label.fill()
        label.font = MMFont.helveticaNeueMedium.withSize(15.0)
        label.textColor = MMColor.black
        label.textAlignment = .center
        
        // GR
        isUserInteractionEnabled = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tap)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Gr
    
    @objc private func didTap() {
        isSelected = true
        delegate?.didTapOnDayLabel(self, completion: {
            self.isSelected = false
        })
    }
    
}
