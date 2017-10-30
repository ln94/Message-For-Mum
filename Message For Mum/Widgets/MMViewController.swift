//
//  MMViewController.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 28/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class MMViewController: UIViewController {
    
    // MARK: - Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Views
    
    public let backgroundImageView: UIImageView = UIImageView()
    public let topBar: UIView = UIView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        // Navigation item
        navigationItem.titleView = UIView()
        navigationItem.hidesBackButton = true
        
        // Make navigation bar transparent
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        // Background image view
        view.addSubview(backgroundImageView)
        backgroundImageView.fill()
        
        // Top bar
        view.addSubview(topBar)
        topBar.alignTo(edge: .top, length: 64.0)
        topBar.backgroundColor = .white
        topBar.addShadow(color: .white, radius: 2.0, opacity: 0.8)
    }

}
