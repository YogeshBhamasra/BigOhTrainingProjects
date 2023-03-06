//
//  ZipCodeUIVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 24/02/23.
//

import UIKit

class ZipCodeUIVC: NSObject, ObservableUIVC {
    var view: ZipCodeVCView
    var viewModel: ObservableVM
    
    init(view: ZipCodeVCView, viewModel: ObservableVM) {
        self.view = view
        self.viewModel = viewModel
    }
    
    func setupUI() {
        setupSpinner()
        setupButton()
        setUIText()
        view.zipcodeRegisterButton.isEnabled = false
        setupCustomField()
    }
    
    func setupButton() {
       
        view.zipcodeRegisterButton.addTarget(self, action: #selector(registerButton), for: .touchUpInside)
        view.zipcodeRegisterButton.backgroundColor = .gray.withAlphaComponent(0.78)
    }
    
    func setupSpinner() {
        view.spinner.center = view.view.center
        view.spinner.frame.size.width = view.view.frame.size.width / 3
        view.spinner.style = .large
        view.view.addSubview(view.spinner)
        view.spinner.isHidden = true
    }
    
    func setupCustomField() {
//        self.view.zipcodeTextField = CustomTextField()
        view.showAddressLabel.text = ""
        view.zipcodeTextField.alertLabel.text = ""
        view.zipcodeTextFieldLabel.text = ""
        view.zipcodeTextFieldLabel.alpha = 0.78
        view.zipcodeTextFieldLabel.font = .getMontserratRegular(ofSize: 12)
        
        guard let textField = self.view.zipcodeTextField else { return }
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.setFont(myFont: .getMontserratRegular(ofSize: 16))
        
        textField.setKeyboardType(type: .numberPad)
        textField.setBorderColor(color: UIColor.lightGray)
        textField.setPadding(paddingValue: CGFloat(0))
        textField.setMaxTextLength(length: 5)
        textField.setPlaceholder(placeholderText: LocalisableString.ZipcodeUIVC.textFieldPlaceholder.localised)
        
        textField.alertLabel.font = .getMontserratRegular(ofSize: 12)
        
        textField.delegate = self
        
    }
    
    @objc func registerButton(_ sender: UIButton) {
        
        guard let view = view as? ZipCodeVC else { return }
        let count = view.zipcodeTextField.text?.count
        if count == 5 {
            view.spinner.isHidden = false
            view.spinner.startAnimating()
            
            if let zipcode = Int(view.zipcodeTextField.text!) {
                verifyZipCode(zipcode: zipcode)
                
            } else {
                view.zipcodeTextField.showError()
                view.zipcodeTextField.alertLabel.text = LocalisableString.ZipcodeUIVC.postalCodeError.localised
                
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                view.spinner.isHidden = true
                view.zipcodeRegisterButton.isEnabled = true
            }
            
        }
        
    }
    
    func popUpView() {
        let vc = PopUpVC.instance()
        view.navigationController?.present(vc, animated: true)
        
    }
    
   
    
    func showValue() {
        if let value = view.store {
            let address = value.store?.address
            let addressString: String = (address?.address1 ?? "") + ",\n" + (address?.address2 ?? "") + ",\n" + (address?.city ?? "") + ",\n" + (address?.province ?? "") + ",\n" + (address?.country ?? "") + "\n" + (address?.zipCode ?? "")
            view.showAddressLabel.text = addressString
            
            
            
            view.zipcodeTextField.alertLabel.text = ""
            view.zipcodeTextField.bottomLine.backgroundColor = UIColor.black.cgColor
            view.zipcodeTextField.alertLabel.textColor = .black
            debugPrint("If block called")
        }
        else if view.store == nil
        {
            debugPrint("Error in else block of showValue() method")
            view.showAddressLabel.text = ""
            view.zipcodeTextField.showError()
            view.zipcodeTextField.alertLabel.text = LocalisableString.ZipcodeUIVC.postalCodeError.localised
            self.popUpView()
            
        }
        
    }
    
    func verifyZipCode(zipcode: Int) {
        view.zipcodeRegisterButton.isEnabled = false
        ZipCodeVM.zipcode = zipcode
        
        guard let VM = viewModel as? ZipCodeVM else { return }

        DispatchQueue.main.async() {
            self.viewModel.fetchData()
        }
        VM.result.bind { [weak self] result in
            self?.view.store = result
            self?.showValue()
        }
    }
    
    func setUIText() {
        view.zipcodeImageView.image = UIImage.illustrations_4 ?? UIImage()
        view.zipcodeTitleLabel.text = LocalisableString.ZipcodeUIVC.titleLabelText.localised
        view.zipcodeTextLabel.text = LocalisableString.ZipcodeUIVC.textLabelText.localised
        
        let buttonTitle = LocalisableString.ZipcodeUIVC.registerButtonTitle.localised
        view.zipcodeRegisterButton.setTitle(buttonTitle, for: .normal)
        view.zipcodeRegisterButton.titleLabel?.font = .getOswaldRegular(ofSize: 15)
        
        view.zipcodeRegisterButton.tintColor = .white
        
    }

}


extension ZipCodeUIVC: UITextFieldDelegate {
    
    @objc func textFieldDidChange(textField: UITextField) {
        view.zipcodeRegisterButton.backgroundColor = .gray.withAlphaComponent(0.78)
        if textField.text?.count == 5 {
            view.zipcodeRegisterButton.isEnabled = true
            view.zipcodeRegisterButton.backgroundColor = .black
            guard let textField = textField as? CustomTextField else { return }
            textField.alertLabel.textColor = .red
            textField.alertLabel.text = ""
            
            textField.resignFirstResponder()
        }

        view.spinner.isHidden = true
        if textField.text == "" {
            view.zipcodeTextFieldLabel.text = ""
                
        } else {
            view.zipcodeTextFieldLabel.text = LocalisableString.ZipcodeUIVC.textFieldPlaceholder.localised
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let textField = textField as? CustomTextField else { return }
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.bottomLine.backgroundColor = UIColor.black.cgColor
        textField.alertLabel.text = ""
        view.spinner.isHidden = true
        
    
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        guard let textField = textField as? CustomTextField else { return }
        textField.alertLabel.text = textField.text
        if let zipcode = Int(textField.text!) {
            textField.alertLabel.text = ""
            debugPrint(zipcode)
        }
        else {
            textField.setBorderColor(color: UIColor.red)
            view.zipcodeTextField.alertLabel.text = LocalisableString.ZipcodeUIVC.postalCodeError.localised
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text?.count == 5 {
            return true
        }
        
        return false
    }
    
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.enablesReturnKeyAutomatically = true
//        return true
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        guard let textField = textField as? CustomTextField else { return true}
        
        if newString.count >= textField.maxLength {
            textField.alertLabel.text = ""
            textField.resignFirstResponder()
            view.zipcodeRegisterButton.isEnabled = true
        }
        else {
            view.zipcodeRegisterButton.isEnabled = false
        }
        
        return newString.count <= textField.maxLength
    }
}
