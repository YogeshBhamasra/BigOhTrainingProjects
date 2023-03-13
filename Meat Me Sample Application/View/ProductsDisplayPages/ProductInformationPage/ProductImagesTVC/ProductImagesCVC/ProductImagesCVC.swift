//
//  ProductImagesCVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 12/03/23.
//

import UIKit

class ProductImagesCVC: UICollectionViewCell {
    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "ProductImagesCVC"
    static func uiNib() -> UINib {
        return UINib(nibName: ProductImagesCVC.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        imageLabel.text = nil
        imageView.image = nil
    }
    
    func setupCell(image: UIImage?, text: String?){
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageLabel.text = text
        imageLabel.font = .getOswaldRegular(ofSize: 14)
        imageLabel.textColor = .white
    }
}
