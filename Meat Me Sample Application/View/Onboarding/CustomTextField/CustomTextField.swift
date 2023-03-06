//
//  CustomTextField.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 25/02/23.
//

import UIKit

class CustomTextField: UITextField {
//    var titleLabel = UILabel()
    var maxLength = 0
    var padding: CGFloat = 0
    var bottomLine = CALayer()
    var alertLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        testTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)

        testTextField()

    }
    
    
    
    func testTextField() {
        borderStyle = .none
        
        bottomLine.frame = CGRect(x: 0, y: Int(frame.size.height) - 2, width: Int(frame.size.width), height: 1)
        alertLabel.frame = CGRect(x: 0, y: Int(frame.size.height) + 10, width: Int(frame.size.width), height: 25)
//        titleLabel.frame = CGRect(x: 0, y: 0, width: Int(frame.size.width), height: 15)
//        titleLabel.clipsToBounds = true
        alertLabel.clipsToBounds = true
        
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        placeholder = LocalisableString.ZipcodeUIVC.textFieldPlaceholder.localised
        font = .getOswaldRegular(ofSize: 16)
        
        layer.addSublayer(bottomLine)
//        addSubview(titleLabel)
        addSubview(alertLabel)
        keyboardType = .numberPad
    }
    
    
    func setBorderColor(color: UIColor) {
        bottomLine.backgroundColor = color.cgColor
    }
    
    func setKeyboardType(type: UIKeyboardType) {
        keyboardType = type
    }
    
    func setFont(myFont: UIFont) {
        font = myFont
    }
    
//    func setTitleLabel(title: String) {
//        titleLabel.text = title
//    }
    
    func setPlaceholder(placeholderText: String) {
        placeholder = placeholderText
    }
    
    func setMaxTextLength(length: Int) {
        maxLength = length
    }
    
    func setPadding(paddingValue: CGFloat) {
        padding = paddingValue
    }
    
    func showError() {
        bottomLine.backgroundColor = UIColor.red.cgColor
        
    }
}

extension CustomTextField {
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect(x: padding, y: 0, width: bounds.width, height: bounds.height)
        return rect
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect(x: padding, y: 0, width: bounds.width, height: bounds.height)
        return rect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect(x: padding, y: 0, width: bounds.width, height: bounds.height)
        return rect
    }
}
