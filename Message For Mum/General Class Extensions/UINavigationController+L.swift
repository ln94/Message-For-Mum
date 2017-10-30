//
//  UINavigationController+L.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 29/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topVC = topViewController {
            if let presentedVC = topVC.presentedViewController,
                !presentedVC.isBeingDismissed {
                return presentedVC.preferredStatusBarStyle
            }
            return topVC.preferredStatusBarStyle
        }
        else {
            return .default
        }
    }
}
