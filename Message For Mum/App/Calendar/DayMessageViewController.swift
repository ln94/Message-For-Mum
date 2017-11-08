//
//  DayMessageViewController.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 1/11/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class DayMessageViewController: MessageViewController {

    // MARK: - Properties
    
    override var maxInset: CGFloat {
        return 37.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Navigation bar
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Back Icon").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(didPressBackButton))
        navigationController?.navigationBar.tintColor = .white
        
        // Top bar
        topBar.height = 101.0
        
        // Header
        
        todayLabel.isHidden = true
        
        dateLabel.alignTo(edge: .top, length: 19.0, insets: UIEdgeInsets(top: 40.0))
        dateLabel.font = MMFont.helveticaNeueMedium.withSize(16.0)
        
        weekdayLabel.y = 66.0
        
        headerLine.y = 100.0
    }

    // MARK: - Buttons
    
    @objc func didPressBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UIScrollViewDelegate
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        super.scrollViewDidScroll(scrollView)
        
        navigationController?.navigationBar.tintColor = colorProportion(min: MMColor.darkGray, max: .white, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
        
        topBar.height = proportion(min: 64.0, max: 101.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
        
        dateLabel.y = proportion(min: 21.0, max: 40.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
        dateLabel.font = MMFont.helveticaNeueMedium.withSize(proportion(min: 14.0, max: 16.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top))
        
        weekdayLabel.y = proportion(min: 41.0, max: 66.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
        
        headerLine.y = proportion(min: 64.0, max: 100.0, propMin: 0.0, propMax: maxInset, propValue: scrollView.contentInset.top)
    }
}
