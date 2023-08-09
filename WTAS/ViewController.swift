//
//  ViewController.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 08.08.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var imgLogo: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "logo2")
        return img
    }()
    
     private lazy var titleName: UILabel = {
         let label = UILabel()
         label.text = "СУРВ"
         label.textColor = .systemOrange
         label.font = UIFont.boldSystemFont(ofSize: 70)
         return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.text = "СИСТЕМА УЧЕТА РАБОЧЕГО ВРЕМЕНИ"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    private lazy var authorization: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Username"
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = .init(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
        textfield.layer.cornerRadius = 15
        return textfield
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = .init(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
        textfield.layer.cornerRadius = 15
        return textfield
    }()
    
    private lazy var button: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(image: UIImage(named: "readyBackground"))
        backgroundImage.contentMode = .scaleAspectFill
        
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        setUpViews()
        setUpConstraints()
    }

}

//MARK: - setUpViews and setUpConstraints
extension ViewController{
    func setUpViews(){
//        view.addSubview(imgLogo)
        view.addSubview(titleName)
        view.addSubview(subtitle)
        view.addSubview(authorization)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
//        view.addSubview(button)
    }
    
    func setUpConstraints(){
//        imgLogo.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().inset(70)
//            make.height.width.equalTo(250)
//        }
        
        titleName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(300)
//            make.top.equalToSuperview().inset(5)
        }
        
        subtitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleName.snp.bottom)
        }
        
        authorization.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(subtitle.snp.bottom).offset(40)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(authorization.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
//        button.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
//        }
    }
}

