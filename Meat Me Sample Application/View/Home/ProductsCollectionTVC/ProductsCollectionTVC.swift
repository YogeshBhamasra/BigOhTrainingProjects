//
//  ProductsCollectionTVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 06/03/23.
//

import UIKit

class ProductsCollectionTVC: UITableViewCell {
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    @IBOutlet weak var productsCollection: UICollectionView!
    
    static let identifier = "ProductsCollectionTVC"
    static func uiNib() -> UINib {
        return UINib(nibName: ProductsCollectionTVC.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
//        productsCollection.register(<#T##nib: UINib?##UINib?#>, forCellWithReuseIdentifier: <#T##String#>)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setHeader() {
        productLabel.text = LocalisableString.ProductCollectionTVC.productLabel.localised
        seeMoreButton.setTitle(LocalisableString.ProductCollectionTVC.seeMoreButtonTitle.localised, for: .normal)
    }
}
