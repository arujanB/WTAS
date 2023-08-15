//
//  NotificationTableViewCell.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 14.08.2023.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    static let IDENTIFIER = "NotificationTableViewCell"
    
    private let logo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "bell"))
        return logo
    }()
    
    private lazy var message: UILabel = {
        let label = UILabel()
        label.text = "Обязательный перерыв 13.00 - 14.00"
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    private lazy var buttonClose: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close"), for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(logo)
        stackView.addArrangedSubview(message)
        stackView.addArrangedSubview(buttonClose)
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - setUpViews() and setUpConstraints()
extension NotificationTableViewCell {
    func setUpViews() {
        addSubview(stackView)
    }
    
    func setUpConstraints(){
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        logo.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
        }
        
        buttonClose.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
