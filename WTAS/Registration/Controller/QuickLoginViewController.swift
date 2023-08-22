//
//  QuickLoginViewController.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 11.08.2023.
//

import UIKit

class QuickLoginViewController: UIViewController {
    
    var pinCode: String = "1234"
    
    private lazy var titleName: UILabel = {
        let name = UILabel()
        name.text = "ВОЙТИ"
        name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textColor = .black
        return name
    }()
    
//    private lazy var pinCodeTextField: UITextField = {
//        let textfield = UITextField()
//        textfield.textContentType = .password
//        textfield.isSecureTextEntry = true
//        textfield.placeholder = ""
//        print(textfield.text)
//        textfield.font = UIFont.systemFont(ofSize: 50)
//        textfield.textAlignment = .center
//        return textfield
//    }()
    
    private var verifyView = VerifyView()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var titlePinCode: UILabel = {
        let name = UILabel()
        name.text = "Введите пин-код"
        name.font = UIFont.systemFont(ofSize: 15)
        name.textColor = .black
        return name
    }()
    
    private lazy var wrongTitlePinCode: UILabel = {
        let name = UILabel()
        name.text = "Неверный пин-код!"
        name.font = UIFont.systemFont(ofSize: 15)
        name.textColor = .red
        return name
    }()
        
    private lazy var buttonOne: UIButton = buttonFunc(number: "1")
    private lazy var button2: UIButton = buttonFunc(number: "2")
    private lazy var button3: UIButton = buttonFunc(number: "3")
    private lazy var button4: UIButton = buttonFunc(number: "4")
    private lazy var button5: UIButton = buttonFunc(number: "5")
    private lazy var button6: UIButton = buttonFunc(number: "6")
    private lazy var button7: UIButton = buttonFunc(number: "7")
    private lazy var button8: UIButton = buttonFunc(number: "8")
    private lazy var button9: UIButton = buttonFunc(number: "9")
    private lazy var button0: UIButton = buttonFunc(number: "0")
    
    private lazy var buttonStar: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("go", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//        button.addTarget(self, action: #selector(buttonSave(_:)), for: .touchUpInside)
                    
        return button
    }()
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("go", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//        button.addTarget(self, action: #selector(buttonRemove(_:)), for: .touchUpInside)
                    
        return button
    }()
    
    private lazy var stackViewOne: UIStackView = stackView(num1: buttonOne, num2: button2, num3: button3)
    private lazy var stackViewFour: UIStackView = stackView(num1: button4, num2: button5, num3: button6)
    private lazy var stackViewSeven: UIStackView = stackView(num1: button7, num2: button8, num3: button9)
    private lazy var stackViewZero: UIStackView = stackView(num1: buttonStar, num2: button0, num3: buttonBack)
    
    private lazy var collectStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(stackViewOne)
        stackView.addArrangedSubview(stackViewFour)
        stackView.addArrangedSubview(stackViewSeven)
        stackView.addArrangedSubview(stackViewZero)
        
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    @objc private func buttonTapped(_ sender: UIButton) {
//        if let buttonText = sender.titleLabel?.text {
////            pinCodeTextField.text?.append(contentsOf: buttonText)
//            for num in 0...3{
//                verifyView.textFieldArray[num].text?.append(contentsOf: buttonText)
//                print("PIN Code: \(verifyView.textFieldArray[num].text)")
//            }
////            print("PIN Code: \(pinCodeTextField.text)")
//        }
        
        let buttonText = sender.titleLabel?.text
        let tag = sender.tag
        var counttextFieldArray = 0
        print("TAG: \(tag)")
    
            
        if tag >= 0 && counttextFieldArray < verifyView.textFieldArray.count {
            let currentTextField = verifyView.textFieldArray[counttextFieldArray]
            currentTextField.text?.append(contentsOf: buttonText ?? "")
            print("CURRENT TEXTFIELD: \(currentTextField.text)")
            // Move focus to the next text field
            if tag < verifyView.textFieldArray.count - 1 {
                verifyView.textFieldArray[tag + 1].becomeFirstResponder()
                print("texfield array \(verifyView.textFieldArray)")
            }
            counttextFieldArray += 1
        }
    }
//
//    @objc private func buttonSave(_ sender: UIButton) {
//        if let buttonSave = pinCodeTextField.text, buttonSave == "1234" {
//            print("Correct: \(pinCodeTextField.text)")
//            let vc = TabBarViewController()
////            navigationController?.pushViewController(vc, animated: true)
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
//        }else {
//            view.addSubview(wrongTitlePinCode)
//            wrongTitlePinCode.snp.makeConstraints { make in
//                make.top.equalTo(pinCodeTextField.snp.bottom).offset(50)
//                make.centerX.equalToSuperview()
//            }
//        }
//    }
//
//    @objc private func buttonRemove(_ sender: UIButton) {
//        pinCodeTextField.text?.dropLast()
//        print("Removed. We have: \(pinCodeTextField.text)")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(image: UIImage(named: "background"))
        backgroundImage.contentMode = .scaleAspectFill
        
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        verifyView.pinCodeDelegate = self
        
        showAlert()
        
        setUpViews()
        setUpConstraints()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "ПРОПУСТИТЬ", message: "Использовать Touch ID для быстрого входа в приложение?", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
    }
    
    func buttonFunc(number: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(number, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                    
        return button
    }
    
    func stackView(num1: UIButton, num2: UIButton, num3: UIButton) -> UIStackView {
        let stackView = UIStackView()
        stackView.addArrangedSubview(num1)
        stackView.addArrangedSubview(num2)
        stackView.addArrangedSubview(num3)
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }

}

//MARK: - check Pin Code
extension QuickLoginViewController: CheckCodeProtocol {
    func check() {
        let pinCodeVar = verifyView.getFieldsPinCode()
        if pinCodeVar == pinCode {
            let vc = TabBarViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }else {
            for i in 0...3{
                verifyView.textFieldArray[i].backgroundColor = .systemGray5
                verifyView.textFieldArray[0].becomeFirstResponder()
                
                print("ERROR")
            }
        }
    }
}

////MARK: - UiTableViewDelegate
//extension QuickLoginViewController: UITableViewDelegate{
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let currentText = (textField.text ?? "") as NSString
//        let newText = currentText.replacingCharacters(in: range, with: string)
//
//        if newText.count <= 4 {
//            return true
//        } else {
//            return false
//        }
//    }
//}

//MARK: - setUpViews() and setUpConstraints()
extension QuickLoginViewController{
    func setUpViews(){
        view.addSubview(titleName)
        view.addSubview(backView)
//        backView.addSubview(pinCodeTextField)
        backView.addSubview(verifyView)
        backView.addSubview(titlePinCode)
        backView.addSubview(collectStackView)
    }
    
    func setUpConstraints(){
        titleName.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(50)
        }
        
        backView.snp.makeConstraints { make in
            make.top.equalTo(titleName.snp.bottom).offset(100)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        titlePinCode.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
//        pinCodeTextField.snp.makeConstraints { make in
//            make.top.equalTo(titlePinCode.snp.bottom).offset(30)
//            make.centerX.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
//        }
        
        verifyView.snp.makeConstraints { make in
            make.top.equalTo(titlePinCode.snp.bottom).offset(30)
//            make.top.equalTo(pinCodeTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
//            make.leading.equalToSuperview().offset(100)
//            make.trailing.equalToSuperview().inset(100)
            make.width.equalTo(100)
        }
        
        collectStackView.snp.makeConstraints { make in
            make.top.equalTo(verifyView.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview()
//            make.bottom.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(50)
        }
    }
    
}
