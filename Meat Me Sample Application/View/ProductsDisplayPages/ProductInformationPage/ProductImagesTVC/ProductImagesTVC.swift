//
//  ProductImagesTVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 11/03/23.
//

import UIKit

class ProductImagesTVC: UITableViewCell {
    @IBOutlet weak var recipesButton: UIButton!
    @IBOutlet weak var imagesCollection: UICollectionView!
    
    var data: [RecipesImagesAndText] = []
    
    static let identifier = "ProductImagesTVC"
    static func uiNib() -> UINib {
        return UINib(nibName: ProductImagesTVC.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imagesCollection.register(ProductImagesCVC.uiNib(), forCellWithReuseIdentifier: ProductImagesCVC.identifier)
        imagesCollection.backgroundColor = .mySurfaceBackground
        imagesCollection.dataSource = self
        imagesCollection.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: [RecipesImagesAndText]?) {
        recipesButton.setTitle("RECETAS", for: .normal)
        recipesButton.titleLabel?.font = .getOswaldSemiBold(ofSize: 14)
        recipesButton.titleLabel?.textColor = .black.withAlphaComponent(0.78)
        
        data = model ?? []
    }
}

extension ProductImagesTVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 396)
    }
}

extension ProductImagesTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductImagesCVC.identifier, for: indexPath) as? ProductImagesCVC
        guard let cell else { return ProductImagesCVC() }
        let model = data[indexPath.row]
        let image = UIImage(data: model.image)
        cell.setupCell(image: image, text: model.text)
        cell.backgroundColor = .white
        return cell
    }
    
    
}

extension ProductImagesTVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20)
    }
}
