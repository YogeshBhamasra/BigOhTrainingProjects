//
//  ProductPriceTVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 11/03/23.
//

import UIKit
import Cosmos

class ProductPriceTVC: UITableViewCell {
    static let identifier = "ProductPriceTVC"
    static func uiNib() -> UINib {
        return UINib(nibName: ProductPriceTVC.identifier, bundle: nil)
    }

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var productWeightLabel: UILabel!
    @IBOutlet weak var numberOfPieces: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productPricePerKG: UILabel!
    @IBOutlet weak var addProductToCartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellButton(font: UIFont, textColor: UIColor, bacgroundColor: UIColor, title: String) {
        addProductToCartButton.setTitle(title, for: .normal)
        addProductToCartButton.titleLabel?.textColor = textColor
        addProductToCartButton.titleLabel?.font = font
        addProductToCartButton.backgroundColor = bacgroundColor
    }
    
    func setupCell(product: ProductDetails) {
        
        setProductName(text: product.productName)
        setProductCount(text: product.numberOfPieces)
        setProductPrice(text: product.productPrice)
        setProductPricePerKG(text: product.productPricePerKG)
        setProductWeight(text: product.productWeight)
        
        productNameLabel.font = .getOswaldSemiBold(ofSize: 28)
        productPrice.font = .getOswaldSemiBold(ofSize: 28)
        productPricePerKG.font = .getMontserratRegular(ofSize: 16)
        productWeightLabel.font = .getMontserratRegular(ofSize: 16)
        numberOfPieces.font = .getMontserratMediumItalic(ofSize: 14)
        
        setupRating(rating: 5)
        
    }
    func setProductName(text: String?) {
        productNameLabel.text = text
    }
    
    func setProductWeight(text: String?) {
        productWeightLabel.text = text
    }
    
    func setProductCount(text: String?) {
        numberOfPieces.text = text
    }
    
    func setProductPrice(text: String?) {
        productPrice.text = text
    }
    
    func setProductPricePerKG(text: String?) {
        productPricePerKG.text = text
    }
    
    func setupRating(rating: Double) {
        ratingView.settings.fillMode = .precise
        ratingView.settings.filledImage = .starFilled
        ratingView.settings.emptyImage = .star
        ratingView.settings.updateOnTouch = true
        ratingView.settings.starSize = 15
        ratingView.rating = rating
    }
}
