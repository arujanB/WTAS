//
//  HomeViewController.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 09.08.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var colorArray: [CGColor] = [.init(red: 4/255, green: 86/255, blue: 123/255, alpha: 1), .init(red: 236/255, green: 107/255, blue: 30/255, alpha: 1), .init(red: 1/255, green: 150/255, blue: 55/255, alpha: 1)]
    var arrayOfNumber:[String] = ["9.00", "325", "325"]
    var arrayLogo: [String] = ["clock", "calendar", "paper"]
    
    private var isSideMenuOpen = false
    
    private let sideMenuVC = SideViewController()
    
    private lazy var titleName: UILabel = {
        let name = UILabel()
        name.text = "ГЛАВНАЯ"
        name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textColor = .black
        return name
    }()
    
    private lazy var circleButton: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.circle"), for: .normal)
        button.addTarget(self, action: #selector(handleSwipeGesture), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(titleName)
        stackView.addArrangedSubview(circleButton)

        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.IDENTIFIER)
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(image: UIImage(named: "home"))
        backgroundImage.contentMode = .scaleAspectFill
        
        //to remove the back icon on the left side of the screen
//        navigationItem.setHidesBackButton(false, animated: false)
        
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        setUpViews()
        setUpConstraints()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //SPACE between tableView
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }

    @objc private func handleSwipeGesture() {
        isSideMenuOpen.toggle()
            
        if isSideMenuOpen && sideMenuVC.view.superview == nil {
            addChild(sideMenuVC)
            view.addSubview(sideMenuVC.view)
            sideMenuVC.view.snp.makeConstraints { make in
                make.trailing.top.bottom.equalToSuperview()
                make.width.equalTo(view.bounds.width / 1.3)
            }
            sideMenuVC.didMove(toParent: self)
        }else {
            // Remove the sideMenuVC's view from the view hierarchy
            sideMenuVC.willMove(toParent: nil)
            sideMenuVC.view.removeFromSuperview()
            sideMenuVC.removeFromParent()
        }
        
        UIView.animate(withDuration: 0.3) {
            self.sideMenuVC.view.snp.updateConstraints { make in
                if self.isSideMenuOpen {
                    make.trailing.equalToSuperview()
                } else {
                    make.trailing.equalToSuperview().offset(-self.view.bounds.width / 1.3)
                }
            }

            self.view.layoutIfNeeded()
        }
    }
    
}

//MARK: - tableView DataSource
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.IDENTIFIER, for: indexPath) as! HomeTableViewCell
        cell.layer.borderColor = colorArray[indexPath.row] //Important SOS: To remove the left and right borders
        cell.backgroundColor = UIColor(cgColor: colorArray[indexPath.row])
        cell.setInfo(number: arrayOfNumber[indexPath.row], logo: arrayLogo[indexPath.row])
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        return cell
    }
    
    //give SPACE between the CELL in uitableview
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 18

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 20
        maskLayer.backgroundColor = UIColor.init(red: 0.118, green: 0.118, blue: 0.118, alpha: 1).cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
}

//MARK: - tableView Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

//MARK: - setUpViews and setUpConstraints()
extension HomeViewController {
    func setUpViews() {
        view.addSubview(stackView)
        stackView.addSubview(circleButton)
        circleButton.addSubview(button)
        view.addSubview(tableView)
    }
    
    func setUpConstraints(){
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(-30)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
        }
        
        circleButton.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
}
