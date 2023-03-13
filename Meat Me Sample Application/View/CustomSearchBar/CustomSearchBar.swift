//
//  CustomSearchBar.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 02/03/23.
//

import UIKit
protocol CustomSearchBarInterface {
    var imageView:UIImageView {get set}
    var padding: CGFloat {get set}
    var border:CALayer {get set}
    func setDefaults()
}
class CustomSearchBar: UITextField,CustomSearchBarInterface {
    var imageView = UIImageView()
    var padding: CGFloat = 0
    var border = CALayer()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDefaults()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setDefaults()
    }

    func setDefaults() {
        borderStyle = .none
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        setImageFrame(frame: CGRect(x: 15, y: 0, width: 25, height: bounds.height))
        placeholder = "Enter Text Here"
        font = .systemFont(ofSize: 14)
        addSubview(imageView)
        
    }
    
    func setBackgroundColor(color: UIColor) {
        backgroundColor = color
    }
    
    func setBorder(borderLayer: CALayer) {
        border = borderLayer
    }
    
    func setImage(image: UIImage?) {
        imageView.image = image
        padding = imageView.frame.width + imageView.frame.minX + 2
    }
    
    func setBorderColor(color: UIColor) {
        border.backgroundColor = color.cgColor
    }
    
    func setKeyboardType(type: UIKeyboardType) {
        keyboardType = type
    }
    
    func setFont(myFont: UIFont) {
        font = myFont
    }
    
    func setPlaceholder(placeholderText: String) {
        placeholder = placeholderText
    }
    
    func setImageFrame(frame: CGRect) {
        imageView.frame = frame
    }
    
    func setBorderFrame(frame: CGRect) {
        border.frame = frame
    }
    
    func setPadding(paddingValue: CGFloat) {
        padding = paddingValue
    }
}

extension CustomSearchBar {
    
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
