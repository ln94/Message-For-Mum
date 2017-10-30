//
//  UITableVIew+L.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 30/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func registerCell(_ cellClass: UITableViewCell.Type) {
        self.register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }
    
    func dequeueCell<T>(_ cellClass: T.Type, for indexPath: IndexPath) -> T where T: UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: String(describing: cellClass), for: indexPath) as! T
    }
}
