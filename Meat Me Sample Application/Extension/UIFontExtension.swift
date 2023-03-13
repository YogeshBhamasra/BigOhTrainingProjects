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
    case montserratLight = "Montserrat-Light"
    case montserratMedium = "Montserrat-Medium"
    case montserratThin = "Montserrat-Thin"
    case montserratExtraLight = "Montserrat-ExtraLight"
    case montserratBold = "Montserrat-Bold"
    case montserratSemiBold = "Montserrat-SemiBold"
    case montserratExtraBold = "Montserrat-ExtraBold"
    case montserratBlack = "Montserrat-Black"
    
    case montserratItalic = "Montserrat-Italic"
    case montserratLightItalic = "Montserrat-LightItalic"
    case montserratMediumItalic = "Montserrat-MediumItalic"
    case montserratThinItalic = "Montserrat-ThinItalic"
    case montserratExtraLightItalic = "Montserrat-ExtraLightItalic"
    case montserratBoldItalic = "Montserrat-BoldItalic"
    case montserratSemiBoldItalic = "Montserrat-SemiBoldItalic"
    case montserratExtraBoldItalic = "Montserrat-ExtraBoldItalic"
    case montserratBlackItalic = "Montserrat-BlackItalic"
    
    case oswaldRegular = "Oswald-Regular"
    case oswaldMedium = "Oswald-Medium"
    case oswaldBold = "Oswald-Bold"
    case oswaldSemiBold = "Oswald-SemiBold"
    case oswaldExtraLight = "Oswald-ExtraLight"
    case oswaldLight = "Oswald-Light"
}

extension UIFont {
    static func getOswaldRegular(ofSize: CGFloat) -> UIFont {
        return UIFont(name: AvailableFontsFamily.oswaldRegular.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    static func getOswaldMedium(ofSize: CGFloat) -> UIFont {
        return UIFont(name: AvailableFontsFamily.oswaldMedium.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    static func getOswaldBold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: AvailableFontsFamily.oswaldBold.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    static func getOswaldSemiBold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: AvailableFontsFamily.oswaldSemiBold.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    static func getOswaldExtraLight(ofSize: CGFloat) -> UIFont {
        return UIFont(name: AvailableFontsFamily.oswaldExtraLight.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    static func getOswaldLight(ofSize: CGFloat) -> UIFont {
        return UIFont(name: AvailableFontsFamily.oswaldLight.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    static func getMontserratRegular(ofSize: CGFloat) -> UIFont {
        return UIFont(name: AvailableFontsFamily.montserratRegular.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    static func getMontserratBold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: AvailableFontsFamily.montserratBold.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    static func getMontserratLight(ofSize: CGFloat) -> UIFont {
        return UIFont(name: AvailableFontsFamily.montserratLight.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    static func getMontserratMediumItalic(ofSize: CGFloat) -> UIFont {
        return UIFont(name: AvailableFontsFamily.montserratMediumItalic.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    
}
