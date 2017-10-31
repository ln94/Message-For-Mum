//
//  CalendarViewController.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 30/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class CalendarViewController: MMViewController, UITableViewDataSource, UITableViewDelegate, MonthTableViewCellDelegate {

    // MARK: - Views
    
    private let tableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Background image
        backgroundImageView.image = #imageLiteral(resourceName: "Calendar Background")
        
        // Top bar separator
        let separator: UIView = UIView(superview: topBar)
        separator.alignTo(edge: .bottom, length: 1.0 / UIScreen.main.scale)
        separator.backgroundColor = MMColor.lightGray
        
        // Title
        let titleLabel: UILabel = UILabel(superview: topBar)
        titleLabel.fill(insets: UIEdgeInsets(top: 20.0))
        titleLabel.applyStyle(.navigationTitle)
        titleLabel.attributedText = String(format: "Календарь %i", MMApp.year).withSpacing(letter: 1.0, alignment: .center)
        
        // Weekdays bar
        let weekdaysBar: UIView = UIView(superview: view)
        weekdaysBar.alignTo(edge: .top, length: MMPadding.grand + MMPadding.tiny, insets: UIEdgeInsets(top: topBar.bottom - MMPadding.tiny, left: MMPadding.small, right: MMPadding.small))
        weekdaysBar.backgroundColor = .white
        weekdaysBar.layer.cornerRadius = MMPadding.tiny
        weekdaysBar.addBarShadow()
        
        let dayLabelWidth: CGFloat = weekdaysBar.width / CGFloat(MMWeekday.count.rawValue)
        for i: Int in 0..<MMWeekday.count.rawValue {
            let dayLabel: UILabel = UILabel(superview: weekdaysBar)
            dayLabel.alignTo(edge: .left, length: dayLabelWidth, insets: UIEdgeInsets(top: 3.0, left: CGFloat(i) * dayLabelWidth))
            dayLabel.font = MMFont.helveticaNeueLight.withSize(10.0)
            dayLabel.textColor = MMColor.black
            dayLabel.addTextShadow(color: MMColor.lightGray)
            dayLabel.attributedText = MMWeekday(rawValue: i)?.title()?.uppercased().withSpacing(letter: 1.0, alignment: .center)
        }
        
        // Table view
        view.addSubview(tableView)
        tableView.fill(insets: UIEdgeInsets(top: topBar.bottom))
        tableView.contentInset.top = weekdaysBar.height - weekdaysBar.layer.cornerRadius
        tableView.contentInset.bottom = MMPadding.grand
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.registerCell(MonthTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        
        // Rearrange views
        view.bringSubview(toFront: weekdaysBar)
        view.bringSubview(toFront: topBar)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MMMonth.count.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(MonthTableViewCell.self, for: indexPath)
        cell.month = MMMonth(rawValue: indexPath.row)!
        cell.delegate = self
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MonthTableViewCell.height(for: MMMonth(rawValue: indexPath.row)!)
    }
    
    // MARK: - MonthTableViewCellDelegate
    
    func didTapOnDate(_ date: Date, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion()
        }
    }
    
}
