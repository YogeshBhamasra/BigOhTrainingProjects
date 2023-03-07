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
    
    var productsData: Products = []
    static let identifier = "ProductsCollectionTVC"
    static func uiNib() -> UINib {
        return UINib(nibName: ProductsCollectionTVC.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        productsCollection.register(DisplayProductsCVC.uiNib(), forCellWithReuseIdentifier: DisplayProductsCVC.identifier)
        setHeader()
        // Initialization code
        productsCollection.dataSource = self
        productsCollection.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setHeader() {
        productLabel.text = LocalisableString.ProductCollectionTVC.productLabel.localised
        seeMoreButton.setTitle(LocalisableString.ProductCollectionTVC.seeMoreButtonTitle.localised, for: .normal)
    }
    
    func setupCell(model: Products) {
        self.productsData = model
        productsCollection.reloadData()
    }
}

extension ProductsCollectionTVC: UICollectionViewDelegate {
    
}

extension ProductsCollectionTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsData.count
//        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DisplayProductsCVC.identifier, for: indexPath) as? DisplayProductsCVC
        guard let cell else { return DisplayProductsCVC() }
        cell.setupCell(product: productsData[indexPath.row])
        
        cell.backgroundColor = .systemGray4
        return cell
    }
    
    
}


extension ProductsCollectionTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: super.frame.width / 2.3, height: super.frame.height - 65)
    }
}
