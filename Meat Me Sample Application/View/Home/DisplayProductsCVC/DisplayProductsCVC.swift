//
//  DisplayProductsCVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 03/03/23.
//

import UIKit
import Cosmos

class DisplayProductsCVC: UICollectionViewCell {
    static let identifier = "DisplayProductsCVC"
    static func uiNib() -> UINib {
        return UINib(nibName: DisplayProductsCVC.identifier, bundle: nil)
    }
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var previouslyOrderedImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    //    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var productWeightLabel: UILabel!
    @IBOutlet weak var numberOfPieces: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productPricePerKG: UILabel!
    @IBOutlet weak var addProductToCartButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
        previouslyOrderedImageView.image = nil
        productNameLabel.text = nil
        productWeightLabel.text = nil
        numberOfPieces.text = nil
        productPrice.text = nil
        productPricePerKG.text = nil

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
        setProductImage(image: UIImage(data: product.productImage))
        setPreviouslyOrderedImage(image: UIImage(data: product.previouslyOrderedImage ?? Data()))
        setProductWeight(text: product.productWeight)
        setupRating(rating: 3)
    }
    
    func setProductImage(image: UIImage?) {
        productImageView.image = image
        productImageView.contentMode = .scaleAspectFill
    }
    
    func setPreviouslyOrderedImage(image: UIImage?) {
        previouslyOrderedImageView.image = image
        previouslyOrderedImageView.contentMode = .scaleAspectFill
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
        ratingView.settings.updateOnTouch = false
        ratingView.settings.starSize = 10
        ratingView.rating = rating
    }
}
