//
//  ConnectViewController.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 10.08.2023.
//

import UIKit

class ConnectViewController: UIViewController {

    private var isSideMenuOpen = false
    private let sideMenuVC = SideViewController()
    private let mainContentVC = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(sideMenuVC)
        view.addSubview(sideMenuVC.view)
        sideMenuVC.view.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(view).dividedBy(2) // Adjust the width as needed
        }
        sideMenuVC.didMove(toParent: self)
                
        addChild(mainContentVC)
        view.addSubview(mainContentVC.view)
        mainContentVC.view.snp.makeConstraints { make in
            make.leading.equalTo(sideMenuVC.view.snp.trailing)
            make.top.bottom.trailing.equalToSuperview()
        }
        mainContentVC.didMove(toParent: self)
                
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        swipeGesture.direction = .right
        mainContentVC.view.addGestureRecognizer(swipeGesture)
    }
    
    @objc private func handleSwipeGesture() {
        isSideMenuOpen.toggle()
            
        UIView.animate(withDuration: 0.3) {
            self.sideMenuVC.view.snp.updateConstraints { make in
                if self.isSideMenuOpen {
                    make.leading.equalToSuperview()
                } else {
                    make.leading.equalToSuperview().offset(-10)
                }
            }
                
            self.view.layoutIfNeeded()
        }
    }

}
