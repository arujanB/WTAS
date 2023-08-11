//
//  MainViewController.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 09.08.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: HomeViewController())
        let vc3 = UINavigationController(rootViewController: HomeViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "circle.circle")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "circle.circle.fill")
        vc2.tabBarItem.image = UIImage(systemName: "circle.circle")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "circle.circle.fill")
        vc3.tabBarItem.image = UIImage(systemName: "circle.circle")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "circle.circle.fill")
        
        vc1.title = "Главная"
        vc2.title = "Сканировать QR"
        vc2.title = "Уведомления"
        
//        setViewControllers([vc1, vc2, vc3], animated: true)
        
    }
}
