//
//  MessageViewController.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 28/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class MessageViewController: MMViewController {

    // MARK: - Views
    
    private let todayLabel: UILabel = UILabel()
    private let dateLabel: UILabel = UILabel()
    private let weekdayLabel: UILabel = UILabel()
    private let headerLine: UIView = UIView()
    private let messageView: MessageView = MessageView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Background image view
        backgroundImageView.image = #imageLiteral(resourceName: "Message Background")
        
        // Header
        
        view.addSubview(todayLabel)
        todayLabel.alignTo(edge: .top, length: 12.0, insets: UIEdgeInsets(top: 37.0))
        todayLabel.applyStyle(.mediumTitle)
        todayLabel.attributedText = "Привет, сегодня".uppercased().withSpacing(letter: 2.0).withTextAlignment(.center)
        
        view.addSubview(dateLabel)
        dateLabel.alignTo(edge: .top, length: 24.0, insets: UIEdgeInsets(top: 60.0))
        dateLabel.applyStyle(.largeTitle)
        dateLabel.attributedText = Date().dateString().withSpacing(letter: 1.5).withTextAlignment(.center)
        
        view.addSubview(weekdayLabel)
        weekdayLabel.alignTo(edge: .top, length: 14.0, insets: UIEdgeInsets(top: 92.0))
        weekdayLabel.applyStyle(.smallTitle)
        weekdayLabel.attributedText = Date().weekdayString().withSpacing(letter: 1.0).withTextAlignment(.center)
        
        view.addSubview(headerLine)
        headerLine.alignTo(edge: .top, length: 1.0, insets: UIEdgeInsets(top: 131.0, left: 50.0, right: 50.0))
        headerLine.backgroundColor = .white
        headerLine.addShadow(color: .white, radius: 4.0)
        
        // Message
        view.addSubview(messageView)
        messageView.y = 165.0
        
    }

}
