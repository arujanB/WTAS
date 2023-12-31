//
//  NotificationViewController.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 14.08.2023.
//

import UIKit

class NotificationViewController: UIViewController {
    
    private lazy var backgraoundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var notificationLogo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "user"))
        logo.contentMode = .topLeft // Set the content mode
        return logo
    }()
    
    private lazy var titleName: UILabel = {
        let title = UILabel()
        title.text = "Уведомления"
        return title
    }()
    
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.addArrangedSubview(notificationLogo)
//        stackView.addArrangedSubview(titleName)
//
//        stackView.distribution = .
//        stackView.axis = .horizontal
//        return stackView
//    }()

    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        return line
    }()
    
    private lazy var myTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: NotificationTableViewCell.IDENTIFIER)
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
        
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        
        setUpViews()
        setUpConstraints()
    }

}

//MARK: - tableViewDataSource
extension NotificationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        cell.backgroundColor = .init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
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
extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

//MARK: - setUpViews() and setUpConstraints()
extension NotificationViewController {
    func setUpViews(){
        view.addSubview(backgraoundView)
        backgraoundView.addSubview(notificationLogo)
        backgraoundView.addSubview(titleName)
        backgraoundView.addSubview(line)
        backgraoundView.addSubview(myTableView)
    }
    
    func setUpConstraints(){
        backgraoundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
        
        notificationLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        titleName.snp.makeConstraints { make in
            make.leading.equalTo(notificationLogo.snp.trailing)
            make.top.equalToSuperview().offset(20)
        }
        
        line.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(titleName.snp.bottom).offset(20)
        }
        
        myTableView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalTo(line.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
