//
//  MessageView.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 29/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class MessageView: UIView {

    // Debug:
    let title: String = "Lorem ipsum!"
    let text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum lorem a nunc mollis ullamcorper eu vel neque. Aenean eget ligula nunc. Suspendisse fringilla consectetur laoreet. Praesent vel mollis risus. Morbi consequat sem quis pharetra eleifend. Mauris et sem non ipsum placerat dictum lobortis varius libero. Praesent non ex sit amet neque aliquam venenatis. Nulla laoreet a erat eget rutrum. Proin congue ultrices ex, ut feugiat lorem varius sit amet. Aenean porta, libero id fermentum maximus, ligula nulla gravida ex, efficitur pretium neque nisl sit amet augue."
    
    // MARK: - Views
    
    private let headerLabel: UILabel = UILabel()
    private let transparentView: TransparentView = TransparentView()
    private let titleLabel: UILabel = UILabel()
    private let textLabel: UILabel = UILabel()
    private let heartButton: HeartButton = HeartButton()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: CGPoint.zero, size: MMApp.screenSize))
        
        // Header
        addSubview(headerLabel)
        headerLabel.alignTo(edge: .top, length: 12.0)
        headerLabel.applyStyle(.mediumTitle)
        headerLabel.attributedText = "Новое сообщение".uppercased().withSpacing(letter: 2.0, alignment: .center)

        // Transparent view
        addSubview(transparentView)
        transparentView.fill(insets: UIEdgeInsets(top: headerLabel.bottom + MMPadding.large, left: MMPadding.small, right: MMPadding.small))
        
        // Heart button
        transparentView.addSubview(heartButton)
        heartButton.alignTo(corner: .topRight, size: CGSize(width: 23.0 + 2 * MMPadding.medium, height: 20.0 + 2 * MMPadding.medium))
        
        // Title
        transparentView.addSubview(titleLabel)
        titleLabel.alignTo(edge: .top, length: 18.0, insets: UIEdgeInsets(top: MMPadding.grand, left: MMPadding.large, right: MMPadding.large))
        titleLabel.applyStyle(.messageTitle)
        titleLabel.attributedText = title.withSpacing(letter: 1.25, line: 3.0, alignment: .center)
        titleLabel.sizeToFit()
        titleLabel.alignTo(edge: .top, length: titleLabel.height, insets: UIEdgeInsets(top: MMPadding.grand, left: MMPadding.large, right: MMPadding.large))

        // Message
        transparentView.addSubview(textLabel)
        textLabel.alignTo(edge: .top, length: 18.0, insets: UIEdgeInsets(top: titleLabel.bottom + MMPadding.medium, left: MMPadding.medium, right: MMPadding.medium))
        textLabel.applyStyle(.messageText)
        textLabel.attributedText = text.withSpacing(letter: 1.0, line: 3.0, alignment: .justified)
        textLabel.sizeToFit()
        textLabel.alignTo(edge: .top, length: textLabel.height, insets: UIEdgeInsets(top: titleLabel.bottom + MMPadding.medium, left: MMPadding.medium, right: MMPadding.medium))

        // Adjust sizes
        transparentView.height = textLabel.bottom + MMPadding.grand
        height = transparentView.bottom
        
        transparentView.fill(insets: UIEdgeInsets(top: headerLabel.bottom + MMPadding.large, left: MMPadding.small, right: MMPadding.small))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
