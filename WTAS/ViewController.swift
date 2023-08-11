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
        label.textColor = UIColor(red: 2/255, green: 85/255, blue: 123/255, alpha: 1)
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
    
    private lazy var wrongLogIn: UILabel = {
        let label = UILabel()
        label.text = "Неверный логин или пароль"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    //MARK: - TextField
    
    private lazy var usernameBackView: UIView = backViewTextField()
    private lazy var passwordBackView: UIView = backViewTextField()
    
    
    //MARK: - username textfield
    private lazy var usernameTextFieldLogo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "user"))
        return logo
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Username"
        return textfield
    }()
    
    //MARK: - password texfield
    private lazy var passwordTextFieldLogo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "password"))
        return logo
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.textContentType = .password
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private lazy var usernameStackView: UIStackView = stackView(img: usernameTextFieldLogo, textField: usernameTextField)
    private lazy var passwordStackView: UIStackView = stackView(img: passwordTextFieldLogo, textField: passwordTextField)

    private lazy var buttonSignIn: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: CGFloat(25/255), green: CGFloat(28/255), blue: CGFloat(50/255), alpha: 1)
        button.layer.cornerRadius = 25

        button.addTarget(self, action: #selector(logInMove), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var buttonForgetPassword: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("ЗАБЫЛИ ПАРОЛЬ?", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 25
        
        let attributedTitle = NSAttributedString(string: "ЗАБЫЛИ ПАРОЛЬ?", attributes: [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ])
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    @objc func logInMove(){
        if(usernameTextField.text == "Aruzhan" && passwordTextField.text == "123") {
            let mainVC = HomeViewController()
//            let mainVC = ConnectViewController()
            navigationController?.pushViewController(mainVC, animated: true)
        }else {
            view.addSubview(wrongLogIn)
            wrongLogIn.snp.makeConstraints { make in
                make.top.equalTo(authorization.snp.bottom).offset(10)
                make.centerX.equalToSuperview()
            }
        }
        
    }

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
    
    //MARK: - function
    func backViewTextField() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderColor = .init(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
        view.layer.borderWidth = 1
        return view
    }
    
    func stackView(img: UIImageView, textField: UITextField) -> UIStackView {
        let stackView = UIStackView()
        stackView.addArrangedSubview(img)
        stackView.addArrangedSubview(textField)

        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }

}

//MARK: - setUpViews and setUpConstraints
extension ViewController{
    func setUpViews(){
//        view.addSubview(imgLogo)
        view.addSubview(titleName)
        view.addSubview(subtitle)
        view.addSubview(authorization)
        view.addSubview(usernameBackView)
        usernameBackView.addSubview(usernameStackView)
        view.addSubview(passwordBackView)
        passwordBackView.addSubview(passwordStackView)
        view.addSubview(buttonSignIn)
        view.addSubview(buttonForgetPassword)
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
        
        //usernameTextField
        usernameBackView.snp.makeConstraints { make in
            make.top.equalTo(authorization.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        usernameTextFieldLogo.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.leading.equalTo(usernameTextFieldLogo.snp.trailing).offset(10)
        }
        
        usernameStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        
        //passwordTextField
        passwordBackView.snp.makeConstraints { make in
            make.top.equalTo(usernameBackView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        passwordTextFieldLogo.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.equalTo(passwordTextFieldLogo.snp.trailing).offset(10)
        }
        
        passwordStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        
        
        //button
        buttonSignIn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordBackView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        buttonForgetPassword.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(buttonSignIn.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
}

