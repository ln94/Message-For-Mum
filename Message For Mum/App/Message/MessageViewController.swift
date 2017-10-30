//
//  MessageViewController.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 28/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class MessageViewController: MMViewController, UIScrollViewDelegate {

    // MARK: - Properties
    
    private let maxInset: CGFloat = 68.0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return scrollView.contentInset.top < maxInset / 2 ? .default : .lightContent
    }
    
    // MARK: - Views
    
    private let scrollView: UIScrollView = UIScrollView()
    private let todayLabel: UILabel = UILabel()
    private let dateLabel: UILabel = UILabel()
    private let weekdayLabel: UILabel = UILabel()
    private let headerLine: UIView = UIView()
    private let messageView: MessageView = MessageView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Background image view
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = #imageLiteral(resourceName: "Message Background")
        
        // Top bar
        topBar.height = 132.0
        topBar.alpha = 0.0
        
        // Header
        
        view.addSubview(todayLabel)
        todayLabel.alignTo(edge: .top, length: 12.0, insets: UIEdgeInsets(top: 37.0))
        todayLabel.applyStyle(.mediumTitle)
        todayLabel.attributedText = "Привет, сегодня".uppercased().withSpacing(letter: 2.0, alignment: .center)
        
        view.addSubview(dateLabel)
        dateLabel.alignTo(edge: .top, length: 24.0, insets: UIEdgeInsets(top: 60.0))
        dateLabel.applyStyle(.largeTitle)
        dateLabel.attributedText = Date().dateString().withSpacing(letter: 1.5, alignment: .center)
        
        view.addSubview(weekdayLabel)
        weekdayLabel.alignTo(edge: .top, length: 14.0, insets: UIEdgeInsets(top: 92.0))
        weekdayLabel.applyStyle(.smallTitle)
        weekdayLabel.attributedText = Date().weekdayString().withSpacing(letter: 1.0, alignment: .center)
        
        view.addSubview(headerLine)
        headerLine.alignTo(edge: .top, length: 1.0, insets: UIEdgeInsets(top: 131.0, left: 50.0, right: 50.0))
        headerLine.backgroundColor = .white
        headerLine.addShadow(color: .white, radius: 4.0)
        
        // Scroll view
        view.addSubview(scrollView)
        scrollView.fill(insets: UIEdgeInsets(top: 64.0))
        scrollView.alwaysBounceVertical = true
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.contentInset.top = maxInset
        scrollView.delegate = self
        
        // Message
        scrollView.addSubview(messageView)
        messageView.y = MMPadding.grand
    }

    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // Change content inset
        scrollView.contentInset.top = clamp(min: 0.0, max: maxInset, -scrollView.contentOffset.y)
        
        // Status bar
        setNeedsStatusBarAppearanceUpdate()
        
        // Resize and show top bar
        topBar.height = proportion(min: 64.0, max: 132.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
        topBar.alpha = proportion(min: 1.0, max: 0.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
        
        // Move and hide today label
        todayLabel.y = proportion(min: 0.0, max: 37.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
        todayLabel.alpha = proportion(min: 0.0, max: 1.0, propMin: maxInset / 2, propMax: maxInset, propValue: scrollView.contentInset.top)
        
        // Move, resize and change color of date label
        dateLabel.y = proportion(min: 18.5, max: 60.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
        dateLabel.font = MMFont.helveticaNeueMedium.withSize(proportion(min: 14.0, max: 20.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top))
        dateLabel.textColor = colorProportion(min: MMColor.black, max: .white, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
        dateLabel.layer.shadowColor = colorProportion(min: MMColor.darkGray, max: .white, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top).cgColor
        
        // Move, resize and change color of weekday label
        weekdayLabel.y = proportion(min: 41.0, max: 92.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
        weekdayLabel.font = MMFont.helveticaNeueLight.withSize(proportion(min: 10.0, max: 12.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top))
        weekdayLabel.textColor = colorProportion(min: MMColor.black, max: .white, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
        weekdayLabel.layer.shadowColor = colorProportion(min: MMColor.darkGray, max: .white, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top).cgColor
        
        // Line
        headerLine.y = proportion(min: 64.0, max: 131.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
        headerLine.alpha = proportion(min: 0.0, max: 1.0, propMin: maxInset / 2, propMax: maxInset, propValue: scrollView.contentInset.top)
    }
    
}
