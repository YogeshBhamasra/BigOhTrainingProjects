//
//  CategoriesCVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 02/03/23.
//

import UIKit

class RailCategoriesCVC: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    
    static let identifier = "RailCategoriesCVC"
    static func uiNib() -> UINib {
        return UINib(nibName: RailCategoriesCVC.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        imageNameLabel.text = nil
    }
    
    func setupCell(image: UIImage?, text: String?, font: UIFont) {
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        
        imageView.image = image
        imageNameLabel.text = text
        imageNameLabel.font = font
        imageNameLabel.clipsToBounds = true
    }

}
