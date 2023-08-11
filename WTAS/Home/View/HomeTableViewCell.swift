//
//  HomeTableViewCell.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 09.08.2023.
//

import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {
    
    static let IDENTIFIER = "HomeTableViewCell"
    
    private lazy var titleName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "ИНТЕРЕСНЫЙ \nПАРАМЕТР"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var number: UILabel = {
        let number = UILabel()
        number.text = "9.00"
        number.font = UIFont.boldSystemFont(ofSize: 40)
        number.textColor = .white
        return number
    }()
    
    private lazy var logo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: ""))
        return logo
    }()
    
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.addArrangedSubview(number)
        stackView.addArrangedSubview(logo)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInfo(number: String, logo: String){
        self.number.text = number
        self.logo.image = UIImage(named: logo)
    }
}

//MARK: - setUpViews() and setUpConstraints()
extension HomeTableViewCell {
    func setUpViews(){
        addSubview(titleName)
        addSubview(stackView)
    }
    
    func setUpConstraints(){
        titleName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(30)
        }
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
//            make.centerX.equalToSuperview()
        }
    }
}
