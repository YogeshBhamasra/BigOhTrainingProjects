//
//  LoginUIVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 09/03/23.
//

import UIKit

class LoginUIVC: NSObject, ObservableUIVC {
    var view: LoginVCView
    var viewModel: ObservableVM
    
    init(view: LoginVCView, viewModel: ObservableVM) {
        self.view = view
        self.viewModel = viewModel
    }
    
    func setupUI() {
        setImage()
        setLabels()
        setTextFields()
        setButtons()
        passwordFieldFunctions()
    }

    func setImage() {
        view.imageView.image = .trade_mark
        view.imageView.contentMode = .scaleAspectFit

    }
    
    func setLabels() {
        view.titleLabel.text = LocalisableString.LoginUIVC.titleLabeltext.localised
        view.emailFieldLabel.text = ""
        view.passwordFieldLabel.text = ""
        
        view.emailFieldLabel.font = .getMontserratRegular(ofSize: 12)
        view.passwordFieldLabel.font = .getMontserratRegular(ofSize: 12)
    }
    
    func setTextFields() {
        guard let emailField = view.emailField as? CustomTextField,
              let passwordField = view.passwordField as? CustomTextField
        else { return }
        
        emailField.setFont(myFont: .getMontserratRegular(ofSize: 16))
        passwordField.setFont(myFont: .getMontserratRegular(ofSize: 16))
        
        emailField.setAlertLabelFont(font: .getMontserratRegular(ofSize: 12))
        passwordField.setAlertLabelFont(font: .getMontserratRegular(ofSize: 12))
        
        emailField.setKeyboardType(type: .emailAddress)
        passwordField.setKeyboardType(type: .asciiCapable)
        
        passwordField.textContentType = .password
        
        emailField.setPlaceholder(placeholderText: LocalisableString.LoginUIVC.emailTextFieldplaceholder.localised)
        passwordField.setPlaceholder(placeholderText: LocalisableString.LoginUIVC.passwordTextFieldPlaceholder.localised)
        
        emailField.delegate = self
        passwordField.delegate = self
        
        emailField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func setButtons() {
        view.loginButton.setTitle(LocalisableString.LoginUIVC.loginButtonTitle.localised, for: .normal)
        view.loginButton.backgroundColor = .black
        view.loginButton.setTitleColor(.white, for: .normal)
        view.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
        let forgotText = NSMutableAttributedString(string: LocalisableString.LoginUIVC.forgotPasswordButtonTitle.localised)
        let forgotRange = NSRange(location: 0, length: forgotText.length)
        
        forgotText.addAttributes( [
            .font : UIFont.getMontserratRegular(ofSize: 14),
            .foregroundColor : UIColor.red,
            .underlineStyle : NSUnderlineStyle.single.rawValue
                        ], range: forgotRange)
        view.fogotPasswordButton.setAttributedTitle(forgotText, for: .normal)
        
        
        let createAccountText = NSMutableAttributedString(string: LocalisableString.LoginUIVC.createAccountButtonTitle.localised)
        let createAccountRange = NSRange(location: 0, length: createAccountText.length)
        
        createAccountText.addAttributes( [
            .font : UIFont.getMontserratRegular(ofSize: 14),
            .foregroundColor : UIColor.lightGray,
            .underlineStyle : NSUnderlineStyle.single.rawValue
                        ], range: createAccountRange)
        view.createAccountButton.setAttributedTitle(createAccountText, for: .normal)
    }
    
    @objc func didTapLogin(_ button: UIButton) {
        let _ = allFieldsValid(email: view.emailField.text, password: view.passwordField.text)
    }
}

extension LoginUIVC: UITextFieldDelegate {
    
    @objc func textFieldDidChange(textField: UITextField) {
        guard let textField = textField as? CustomTextField else { return }
        if textField == view.emailField {
            if textField.text == "" {
                view.emailFieldLabel.text = ""
                
            } else {
                view.emailFieldLabel.text = LocalisableString.LoginUIVC.emailTextFieldAlertLabelText.localised
                debugPrint(validateEmail(email: textField.text ?? "") ?? "Valid Email")
            }
        }
        else if textField == view.passwordField {
            if textField.text?.count ?? 0 > 0 {
                textField.isSecureTextEntry = true
                
                debugPrint(textField.text ?? "")
            }
            if textField.text == "" {
                view.passwordFieldLabel.text = ""
                
            } else {
                view.passwordFieldLabel.text = LocalisableString.LoginUIVC.passwordTextFieldPlaceholder.localised
                
                debugPrint(validatePassword(password: textField.text ?? "") ?? "Valid Password")
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let textField = textField as? CustomTextField else { return }
        if textField == view.emailField {
            textField.backgroundColor = .white
            textField.textColor = .black
            textField.bottomLine.backgroundColor = UIColor.black.cgColor
            textField.alertLabel.text = ""
        }
        else if textField == view.passwordField {
            
            textField.backgroundColor = .white
            textField.textColor = .black
            textField.bottomLine.backgroundColor = UIColor.black.cgColor
            textField.alertLabel.text = ""
        }
        
    
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        guard let textField = textField as? CustomTextField else { return }
        textField.alertLabel.textColor = .red
        if textField == view.emailField {
            textField.alertLabel.text = LocalisableString.LoginUIVC.emailTextFieldAlertLabelText.localised
            
        }
        
        else if textField == view.passwordField {
            textField.alertLabel.text = LocalisableString.LoginUIVC.passwordTextFieldAlertLabel.localised
        }
    }
    
    
}

//MARK: - Extension for validations functions
extension LoginUIVC {
    //MARK: - Email Validation function
    func validateEmail(email: String) -> String? {
        let emailPattern = "^[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z]+$"
        if !isValidPattern(regex: emailPattern, text: email) {
            return "Not Valid Email"
        }
        if email.count < 8 {
            return "Not Valid Email"
        }
        return nil
    }
    
    //MARK: - Password Validation function
    func validatePassword(password: String) -> String? {
        
        let numberPattern = ".*[0-9]+.*"
        let lowerCasePattern = ".*[a-z]+.*"
        let upperCasePattern = ".*[A-Z]+.*"
        let specialCharacters = ".*[!@#$%^&*-+]+.*"
        
        let hasNumber = isValidPattern(regex: numberPattern, text: password)
        let hasUppercaseLetter = isValidPattern(regex: upperCasePattern, text: password)
        let hasLowercaseLetter = isValidPattern(regex: lowerCasePattern, text: password)
        let hasSpecialChar = isValidPattern(regex: specialCharacters, text: password)
        
        if !hasNumber || !hasSpecialChar || !hasLowercaseLetter || !hasUppercaseLetter {
            var errorString = "Enter "
            
            errorString += !hasUppercaseLetter ? "atleast one upper case alphabet " : ""
            errorString += !hasLowercaseLetter ? "atleast one lower case alphabet " : ""
            errorString += !hasNumber ? "atleast one number " : ""
            errorString += !hasSpecialChar ? "atleast one special char " : ""
            
            return errorString
        }
        
        if password.count < 10 {
            return "Enter at least 10 characters"
        }
        
        return nil
    }
    
    //MARK: - Regex Checking function
    func isValidPattern(regex: String, text: String) -> Bool {
        let trimmedText = text.trimmingCharacters(in: .whitespaces)
        let match = NSPredicate(format: "SELF MATCHES %@", regex)
        return match.evaluate(with: trimmedText)
    }
    
    //MARK: - Check if all field are valid
    func allFieldsValid(email: String?, password: String?) -> Bool {
        if let _ = validateEmail(email: email ?? ""), let _ = validatePassword(password: password ?? ""){
            debugPrint("Inalid Email and Password")
            return false
        } else {
            debugPrint("All fields are valid")
            return true
        }
        
    }
}

//MARK: - Adding addtional features to the password Field
extension LoginUIVC {
    func passwordFieldFunctions(){
        let hidePasswordButton = UIButton()
        let bounds = view.passwordField.bounds
        hidePasswordButton.frame = CGRect(x: bounds.width - 50, y: 5, width: 50, height: bounds.height - 10)
        hidePasswordButton.addTarget(self, action: #selector(didTapHidePasswordButton), for: .touchUpInside)
        
        hidePasswordButton.setTitle("Show", for: .normal)
        hidePasswordButton.setTitleColor(.lightGray, for: .normal)
        hidePasswordButton.titleLabel?.font = .getMontserratRegular(ofSize: 12)
        view.passwordField.addSubview(hidePasswordButton)
        guard let textField = view.passwordField as? CustomTextField else { return }
        textField.setRightPadding(padding: hidePasswordButton.frame.width)
    }
    
    @objc func didTapHidePasswordButton(_ button: UIButton){
        if button.titleLabel?.text == "Show" {
            button.setTitle("Hide", for: .normal)
            view.passwordField.isSecureTextEntry = false
        } else {
            button.setTitle("Show", for: .normal)
            view.passwordField.isSecureTextEntry = true
        }
    }
}
