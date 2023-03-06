//
//  HomeTVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 04/03/23.
//

import UIKit

class HomeTVC: UITableViewCell {
    @IBOutlet weak var customCollectionView: UICollectionView!
    
    static var models: [CellType] = []
    static var railCategoriesImagesData: [Data] = []
    static let identifier = "HomeTVC"
    static func uiNib() -> UINib {
        return UINib(nibName: HomeTVC.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        customCollectionView.register(SlideShowImagesCVC.uiNib(),
                                      forCellWithReuseIdentifier: SlideShowImagesCVC.identifier)
        customCollectionView.register(DisplayProductsCVC.uiNib(),
                                      forCellWithReuseIdentifier: DisplayProductsCVC.identifier)
        customCollectionView.register(RailCategoriesCVC.uiNib(),
                                      forCellWithReuseIdentifier: RailCategoriesCVC.identifier)
        customCollectionView.dataSource = self
        customCollectionView.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func registerCollectionViewCell(customCollection: UICollectionView!, identifier: String, nib: UINib) {
        guard let collectionView = customCollectionView else { return }
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
        
    }
}

extension HomeTVC: UICollectionViewDelegate {
    
}

extension HomeTVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeTVC.models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = HomeTVC.models[indexPath.row]
        
        
        
        switch model {
            
        case .railCategory(model: let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RailCategoriesCVC.identifier, for: indexPath) as? RailCategoriesCVC
            guard let cell else { return SlideShowImagesCVC()}
            debugPrint(HomeTVC.railCategoriesImagesData[indexPath.row])
            cell.setupCell(image: UIImage(named: "illustrations_1"), text: model[0].name, font: .getOswaldRegular(ofSize: 14))
            return cell
            
        case .products(model: let model, rows: _):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DisplayProductsCVC.identifier, for: indexPath) as? DisplayProductsCVC
            guard let cell else { return SlideShowImagesCVC()}
            cell.setProductImage(image: UIImage(data: model[0].productImage))
            return cell
            
        case .images(image: let image):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideShowImagesCVC.identifier, for: indexPath) as? SlideShowImagesCVC
            guard let cell else { return SlideShowImagesCVC()}
            cell.setupImage(image: image[0], frame: CGRect(x: 0, y: 0, width: contentView.bounds.width, height: 550))
            return cell
        }
        
        
//        return UICollectionViewCell()
    }
    
    
}
