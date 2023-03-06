//
//  UIFontExtension.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 23/02/23.
//

import UIKit
//Fonts to be used in application

enum FontFamily {
    case title
    case subtitle
}

enum FontSize: Int {
    case small = 14
    case medium = 18
    case large = 22
}

enum AvailableFontsFamily: String {
    case montserratRegular = "Montserrat-Regular"
    case oswaldRegular = "Oswald-Regular"
}

extension UIFont {
    static func getOswaldRegular(ofSize: CGFloat) -> UIFont {
        return UIFont(name: AvailableFontsFamily.oswaldRegular.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    static func getMontserratRegular(ofSize: CGFloat) -> UIFont {
        return UIFont(name: AvailableFontsFamily.montserratRegular.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
}
