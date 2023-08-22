//
//  VerifyTextField.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 16.08.2023.
//

import UIKit
import SnapKit

protocol TextFieldProtocol {
    func nextTextField(tag: Int)
    func deleteTextField(tag: Int)
}

class VerifyTextField: UITextField {
    
    var textFieldDelegate: TextFieldProtocol?
    
    private func changeTextField() {
        backgroundColor = .systemGray3
        layer.cornerRadius = 10
        textAlignment = .center
        tintColor = .clear
//        layer.cornerRadius = frame.height / 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        changeTextField()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func deleteBackward() {
        textFieldDelegate?.deleteTextField(tag: tag)
        backgroundColor = .systemGray5
    }
    
}

//MARK: - when you click to the textField it shows border
extension VerifyTextField: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.length == 0 {
            textFieldDelegate?.nextTextField(tag: tag)
            resignFirstResponder()
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.backgroundColor = UIColor.systemGray5.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.backgroundColor = UIColor.orange.cgColor
    }
}
