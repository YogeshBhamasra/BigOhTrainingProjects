//
//  ProductDescriptionTVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 11/03/23.
//

import UIKit

class ProductDescriptionTVC: UITableViewCell {
    
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var informationLabel1: UILabel!
    @IBOutlet weak var informationLabel2: UILabel!
    @IBOutlet weak var informationLabel3: UILabel!
    @IBOutlet weak var informationMeasureLabel1: UILabel!
    @IBOutlet weak var informationMeasureLabel2: UILabel!
    @IBOutlet weak var informationMeasureLabel3: UILabel!
    
    @IBOutlet weak var seeMoreButton1: UIButton!
    @IBOutlet weak var seeMoreButton2: UIButton!
    
    static let identifier = "ProductDescriptionTVC"
    static func uiNib() -> UINib {
        return UINib(nibName: ProductDescriptionTVC.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: ProductDescriptionModel?) {
        descriptionTitle.text = model?.title
        productDescription.text = model?.descriptionBody
        
        informationLabel1.text = model?.infoLabels[0].infoLabel
        informationLabel2.text = model?.infoLabels[1].infoLabel
        informationLabel3.text = model?.infoLabels[2].infoLabel
        
        informationMeasureLabel1.text = model?.infoLabels[0].weightLabel
        informationMeasureLabel2.text = model?.infoLabels[1].weightLabel
        informationMeasureLabel3.text = model?.infoLabels[2].weightLabel
        
        let title = UnderlinedLabel()
        title.text = LocalisableString.ProductInfoUIVC.seeMoreButtonTitle.localised
        seeMoreButton1.setAttributedTitle(title.attributedText, for: .normal)
        seeMoreButton2.setAttributedTitle(title.attributedText, for: .normal)
        
        descriptionTitle.font = .getOswaldSemiBold(ofSize: 14)
        descriptionTitle.textColor = .black.withAlphaComponent(0.78)
        
        productDescription.font = .getMontserratRegular(ofSize: 16)
        productDescription.textColor = .black.withAlphaComponent(0.78)
        
        informationLabel1.font = .getMontserratRegular(ofSize: 16)
        informationLabel1.textColor = .black.withAlphaComponent(0.78)
        informationMeasureLabel1.font = .getMontserratBold(ofSize: 14)
        informationMeasureLabel1.textColor = .black.withAlphaComponent(0.78)
        
        informationLabel2.font = .getMontserratRegular(ofSize: 16)
        informationLabel2.textColor = .black.withAlphaComponent(0.78)
        informationMeasureLabel2.font = .getMontserratBold(ofSize: 14)
        informationMeasureLabel2.textColor = .black.withAlphaComponent(0.78)
        
        informationLabel3.font = .getMontserratRegular(ofSize: 16)
        informationLabel3.textColor = .black.withAlphaComponent(0.78)
        informationMeasureLabel3.font = .getMontserratBold(ofSize: 14)
        informationMeasureLabel3.textColor = .black.withAlphaComponent(0.78)
        
        seeMoreButton1.titleLabel?.font = .getOswaldRegular(ofSize: 14)
        seeMoreButton1.titleLabel?.textColor = .black.withAlphaComponent(0.78)
        
        seeMoreButton2.titleLabel?.font = .getOswaldRegular(ofSize: 14)
        seeMoreButton2.titleLabel?.textColor = .black.withAlphaComponent(0.78)
        
    }
}
