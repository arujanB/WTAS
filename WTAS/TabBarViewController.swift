//
//  TabBarViewController.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 11.08.2023.
//

import UIKit
import SnapKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        tabBar.barTintColor = UIColor.black
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: HomeViewController())
        let vc3 = UINavigationController(rootViewController: NotificationViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "circle.circle")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "circle.circle.fill")
        vc2.tabBarItem.image = UIImage(systemName: "circle.circle")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "circle.circle.fill")
        vc3.tabBarItem.image = UIImage(systemName: "circle.circle")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "circle.circle.fill")
        
        vc1.title = "ГЛАВНАЯ"
        vc2.title = "СКАНИРОВАТЬ QR"
        vc3.title = "УВЕДОМЛЕНИЯ"
        
        setViewControllers([vc1, vc2, vc3], animated: true)
    }
}
