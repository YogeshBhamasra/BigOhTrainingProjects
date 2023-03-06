//
//  PopUpUIVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 28/02/23.
//

import UIKit

class PopUpUIVC: NSObject, ObservableUIVC {
    var view: PopUpVCView
    var viewModel: ObservableVM
    
    init(view: PopUpVCView, viewModel: ObservableVM) {
        self.view = view
        self.viewModel = viewModel
    }
    
    func setupUI() {
        registerButton()
        setupUIText()
    }
    
    func registerButton() {
        view.closeButton.addTarget(self, action: #selector(popCloseButtonTapped), for: .touchUpInside)
        view.changeZipCodeButton.addTarget(self, action: #selector(popChangeButtonTapped), for: .touchUpInside)
    }
    
    @objc func popChangeButtonTapped(_ sender: UIButton) {
        let vc = HomeVC.instance()
        vc.modalPresentationStyle = .overFullScreen
        view.present(vc, animated: true)
    }
    
    @objc func popCloseButtonTapped(_ sender: UIButton) {
        view.dismiss(animated: true)
    }
    
    func setupUIText() {
        let textField = view.textField
        textField?.setKeyboardType(type: .emailAddress)
        textField?.setPlaceholder(
            placeholderText: LocalisableString.PopUIVC.textFieldPlaceholder.localised
        )
        
        view.titleLabel.text = LocalisableString.PopUIVC.headingLabelText.localised
        view.subTitle.text = LocalisableString.PopUIVC.subheadingLabelText.localised
        view.textFieldLabel.text = LocalisableString.PopUIVC.textFieldLabel.localised
        
        view.changeZipCodeButton.setTitle(LocalisableString.PopUIVC.zipCodeButtonTitle.localised, for: .normal)
        view.changeZipCodeButton.layer.borderWidth = 1.0
        view.changeZipCodeButton.layer.borderColor = UIColor.black.cgColor
        
        view.notifyButton.setTitle(LocalisableString.PopUIVC.notifyButtonTitle.localised, for: .normal)
    }
    
}
