//
//  ButtonDesign.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 28/02/23.
//

import UIKit

class Button: UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
