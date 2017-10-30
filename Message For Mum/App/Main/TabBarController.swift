//
//  TabBarController.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 27/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - View controllers
    
    public let messageVC: MessageViewController = MessageViewController()
    public let calendarVC: UIViewController = UIViewController()
    public let savedVC: UIViewController = UIViewController()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        
        // Tab bar
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.tintColor = MMColor.lightGray
        tabBar.unselectedItemTintColor = MMColor.lightGray

        // Tab bar shadow
        let shadowView: UIView = UIView(superview: tabBar)
        shadowView.fill()
        shadowView.backgroundColor = .white
        shadowView.addShadow(color: .white, offset: CGPoint(x: 0.0, y: -4.0), radius: 4.0, opacity: 0.8)
        
        // View controllers
        let messageNavVC: UINavigationController = UINavigationController(rootViewController: messageVC)
        messageNavVC.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "Message Icon"), selectedImage: #imageLiteral(resourceName: "Message Icon Selected"))
        
        let calendarNavVC: UINavigationController = UINavigationController(rootViewController: calendarVC)
        calendarNavVC.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "Calendar Icon"), selectedImage: #imageLiteral(resourceName: "Calendar Icon Selected"))
        
        let savedNavVC: UINavigationController = UINavigationController(rootViewController: savedVC)
        savedNavVC.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "Heart Icon"), selectedImage: #imageLiteral(resourceName: "Heart Icon Selected"))
        
        viewControllers = [messageNavVC, calendarNavVC, savedNavVC]
        
        for vc in viewControllers! {
            vc.tabBarItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        }
    }

}
