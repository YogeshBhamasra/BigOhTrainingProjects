//
//  RailCollectionTVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 06/03/23.
//

import UIKit

class RailCollectionTVC: UITableViewCell {
    
    @IBOutlet weak var railCollectionView: UICollectionView!
    var cellData: [CategoryModel] = []
    var railCategoriesImagesData: [Data] = []
    
    static let identifier = "RailCollectionTVC"
    static func uiNib() -> UINib {
        return UINib(nibName: RailCollectionTVC.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        backgroundColor = .systemGray4
        railCollectionView.register(RailCategoriesCVC.uiNib(), forCellWithReuseIdentifier: RailCategoriesCVC.identifier)
        railCollectionView.dataSource = self
        railCollectionView.delegate = self
        railCollectionView.backgroundColor = .systemGray4
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setupCell(model: [CategoryModel], imagesData: [Data]) {
        self.cellData = model
        self.railCategoriesImagesData = imagesData
        railCollectionView.reloadData()
    }
}

extension RailCollectionTVC: UICollectionViewDelegate {
    
}

extension RailCollectionTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return railCategoriesImagesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RailCategoriesCVC.identifier, for: indexPath) as? RailCategoriesCVC
        guard let cell else { return RailCategoriesCVC() }
        let data = cellData[indexPath.row]
        let image = UIImage(data: railCategoriesImagesData[indexPath.row])
        cell.setupCell(image: image, text: data.name, font: .getMontserratRegular(ofSize: 12))
        
        return cell
    }
    
    
}
