//
//  LocalisableString.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 23/02/23.
//

import Foundation


class LocalisableString {
    //MARK: - Onboarding CVC Localised Text
    enum OnboardingCVC: String {
        var localised: String {
            return self.rawValue.localized
        }
        case title1 = "onboardingCVC/titleLable_1"
        case title2 = "onboardingCVC/titleLable_2"
        case title3 = "onboardingCVC/titleLable_3"
        
        case body1 = "onboardingCVC/bodyLable_1"
        case body2 = "onboardingCVC/bodyLable_2"
        case body3 = "onboardingCVC/bodyLable_3"
    }
    
    //MARK: - Onboarding VC Localised Text
    enum OnboardingVC: String {
        var localised: String {
            return self.rawValue.localized
        }
        
        case nextButtonTitle = "onboardingUIVC/nextButton/titleText"
        
        case skipButtonTitle1 = "onboardingUIVC/skipButton/titleText1"
        case skipButtonTitle2 = "onboardingUIVC/skipButton/titleText2"
    }
    
    //MARK: - ZipCode UIVC Localised Text
    enum ZipcodeUIVC: String {
        var localised: String {
            return self.rawValue.localized
        }
        case registerButtonTitle = "zipCodeVC/enterButton/title"
        case textFieldPlaceholder = "zipCodeVC/textField/placeholder"
        case titleLabelText = "zipCodeVC/titleLabel1"
        case textLabelText = "zipCodeVC/bodyLabel1"
        
        case postalCodeError = "zipCodeVC/textField/errorLabel1"
    }
    
    //MARK: - PopUp UIVC Localised Text
    enum PopUIVC: String {
        var localised: String {
            return self.rawValue.localized
        }
        case headingLabelText = "popUpUIVC/label/headingLabel"
        case subheadingLabelText = "popUpUIVC/label/subHeadingLabel"
        case textFieldLabel = "popUpUIVC/label/textFieldLabel"
        case textFieldPlaceholder = "popUpUIVC/textField/placeholder"
        case notifyButtonTitle = "popUpUIVC/notifyButton/titleLabel"
        case zipCodeButtonTitle = "popUpUIVC/changeZipCodeButton/titleLabel"
    }
    
    //MARK: - Home UIVC Localised Text
    enum HomeUIVC: String {
        var localised: String {
            return self.rawValue.localized
        }
        
        case searchBarPlaceholder = "homeUIVC/SearchBar/placeholder"
        case changeZipcodeTitle = "homeUIVC/ZipCodeButton/title"
    }
    
    //MARK: - ProductCollection TVC Localised Text
    enum ProductCollectionTVC: String {
        var localised: String {
            return self.rawValue.localized
        }
        case seeMoreButtonTitle = "productsCollectionTVC/seeMoreButton/titleLabel"
        case productLabel = "productsCollectionTVC/productLabel/Text"
    }
}
