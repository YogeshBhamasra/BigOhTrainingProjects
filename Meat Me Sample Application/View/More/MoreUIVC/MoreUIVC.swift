//
//  MoreUIVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 07/03/23.
//

import UIKit

class MoreUIVC: NSObject, ObservableUIVC {

    var view: MoreVCView
    var viewModel: ObservableVM
    
    init(view: MoreVCView, viewModel: ObservableVM) {
        self.view = view
        self.viewModel = viewModel
    }
    
    func setupUI() {
        setNavigationBarItems()
        setupButtons()
        setLabels()
    }
    
    func setNavigationBarItems() {
        view.navigationController?.navigationBar.tintColor = .black
        view.navigationController?.navigationBar.backgroundColor = .systemBackground
        let size = CGSize(width: 108, height: 20)
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { context in
            UIImage.trade_mark?.draw(in: CGRect(origin: .zero, size: size))
        }
        let imageView = UIImageView(image: image)
        let leftImage = UIBarButtonItem(customView: imageView)
        
        view.navigationItem.leftBarButtonItem = leftImage
        view.navigationItem.leftBarButtonItem?.action = .none
        
        view.navigationItem.rightBarButtonItems = [
            .init(image: .homeCart, style: .plain, target: self, action: .none),
            .init(title: "$ 0.00", style: .plain, target: self, action: .none)
        ]
    }
    
    func setupButtons() {
        setButton(button: view.howToBuyButton, text: LocalisableString.MoreUIVC.howToBuyButtonTitle.localised, image: .moreUIVCBuy)
        setButton(button: view.ourHistoryButton, text: LocalisableString.MoreUIVC.ourHistoryButtonTitle.localised, image: .moreUIVCHistory)
        setButton(button: view.recipesButton, text: LocalisableString.MoreUIVC.recipesButtonTitle.localised, image: .moreUIVCRecipe)
        setButton(button: view.findYourStoreButton, text: LocalisableString.MoreUIVC.findYourStoreButtonTitle.localised, image: .moreUIVCStore)
        setButton(button: view.billingButton, text: LocalisableString.MoreUIVC.billingButtonTitle.localised, image: .moreUIVCInvoice)
        setButton(button: view.whyFrozenButton, text: LocalisableString.MoreUIVC.whyFrozenButtonTitle.localised, image: .moreUIVCFrozen)
        setButton(button: view.grillometerButton, text: LocalisableString.MoreUIVC.grillometerButtonTitle.localised, image: .moreUIVCGrill)
        setButton(button: view.qrScanButton, text: LocalisableString.MoreUIVC.qrScanButtonTitle.localised, image: .moreUIVCQR)
        setButton(button: view.balanceEnquiryButton, text: LocalisableString.MoreUIVC.balanceEnquiryButtonTitle.localised, image: .moreUIVCbalanceEnquiry)
        setButton(button: view.frequentQuestionsButton, text: LocalisableString.MoreUIVC.frequentQuestionsButtonTitle.localised, image: .moreUIVCFAQ)
        setButton(button: view.jobBagButton, text: LocalisableString.MoreUIVC.jobBagButtonTitle.localised, image: .moreUIVCJob)
        setButton(button: view.privacyNoticeButton, text: LocalisableString.MoreUIVC.privacyNoticeButtonTitle.localised, image: .moreUIVCPrivacy)
        
    }
    
    func setButton(button: UIButton, text: String, image: UIImage?) {
        button.setAttributedTitle(attributedLabelWithImages(text: text), for: .normal)
        setImages(leadingImage: image, button: button)
        button.contentHorizontalAlignment = .left
        
    }
    
    func setLabels() {
        view.versionLabel.text = LocalisableString.MoreUIVC.versionLabelText.localised
        view.versionLabel.font = .getMontserratRegular(ofSize: 10)
        view.versionLabel.textColor = .black
    }
    
    func attributedLabelWithImages(text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: text.count)
        
        attributedString.addAttribute(.font, value: UIFont.getOswaldRegular(ofSize: 14), range: range)
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: range)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        return attributedString
    }
    
    func setImages(leadingImage: UIImage?, button: UIButton) {
//        let leadingImageView = UIImageView(image: leadingImage)
//        leadingImageView.contentMode = .scaleAspectFit
//        leadingImageView.frame = CGRect(x: 0, y: button.frame.height - 28, width: 32, height: 32)
        button.setImage(leadingImage, for: .normal)
        
        
        let trailingImageView = UIImageView(image: .moreUIVCNext)
        trailingImageView.contentMode = .scaleAspectFit
        trailingImageView.frame = CGRect(x: button.bounds.width - 32, y: button.frame.height - 27, width: 32, height: 32)
        
//        button.addSubview(leadingImageView)
        button.addSubview(trailingImageView)

        
    }
    
}
