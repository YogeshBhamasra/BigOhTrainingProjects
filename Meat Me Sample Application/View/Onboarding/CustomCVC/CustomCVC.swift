//
//  CustomCVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 23/02/23.
//

import UIKit

class CustomCVC: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellTextLabel: UILabel!
    
    static let identifier = "CustomCVC"
    static func uiNib() -> UINib {
        return UINib(nibName: CustomCVC.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        cellImageView.image = nil
        cellTitleLabel.text = nil
        cellTextLabel.text = nil
    }
    
    func setupCell(image: UIImage, title: String, body: String) {
        
        
        cellImageView.image = image
        cellTitleLabel.text = title
        cellTextLabel.text = body
        
        cellTitleLabel.font = .getOswaldRegular(ofSize: 28)
        cellTextLabel.font = .getMontserratRegular(ofSize: 16)
        
        cellTitleLabel.textAlignment = .center
        cellTextLabel.textAlignment = .center
        
    }
}
