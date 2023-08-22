//
//  VerifyView.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 17.08.2023.
//

import UIKit
import SnapKit

protocol CheckCodeProtocol {
    func check()
}

class VerifyView: UIView {
    
    var stackView = UIStackView()
    var textFieldArray = [VerifyTextField]()
    
    var pinCodeDelegate: CheckCodeProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createTextField()
        textFieldArray[0].becomeFirstResponder()
        setUpConstraints()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTextField() {
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.backgroundColor = .purple
        
        for index in 0...3{
            let textField = VerifyTextField()
            textField.frame =  CGRect(x: 50, y: 100, width: 200, height: 40)
            textField.tag = index
            textField.textFieldDelegate = self
            textFieldArray.append(textField)
            stackView.addArrangedSubview(textField)
        }
    }
    
    func getFieldsPinCode() -> String {
        var fieldsCode = ""
        textFieldArray.forEach {
            fieldsCode.append($0.text!)
        }
        print(fieldsCode)
        
        return fieldsCode
    }
}

//MARK: - textFieldProtocol
extension VerifyView: TextFieldProtocol {
    func nextTextField(tag: Int) {
        if tag != textFieldArray.count - 1 {
            textFieldArray[tag + 1].becomeFirstResponder()
        }else {
            print("Should open new Screen")
            pinCodeDelegate?.check()
        }
    }
    
    func deleteTextField(tag: Int) {
        if tag != 0 {
            textFieldArray[tag - 1].text = ""
            textFieldArray[tag - 1].becomeFirstResponder()
        }
    }
}

//MARK: - setUpConstraints()
extension VerifyView {
    func setUpConstraints() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
        ])
    }
}


