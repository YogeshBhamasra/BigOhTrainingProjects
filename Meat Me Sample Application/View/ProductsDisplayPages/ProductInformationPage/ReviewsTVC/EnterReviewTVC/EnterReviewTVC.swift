//
//  EnterReviewTVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 11/03/23.
//

import UIKit

class EnterReviewTVC: UITableViewCell {
    @IBOutlet weak var reviewsButton: UIButton!
    @IBOutlet weak var writeReviewButton: UIButton!
    @IBOutlet weak var seeReviewsButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!
    
    static let identifier = "EnterReviewTVC"
    static func uiNib() -> UINib {
        return UINib(nibName: EnterReviewTVC.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell() {
        ratingLabel.text = "26 Reseñas"
        ratingLabel.font = .getMontserratLight(ofSize: 10)
        
        reviewsButton.setTitle("RESEÑAS", for: .normal)
        reviewsButton.tintColor = .black.withAlphaComponent(0.78)
        reviewsButton.backgroundColor = .clear
        reviewsButton.titleLabel?.font = .getOswaldSemiBold(ofSize: 14)
        
        writeReviewButton.setTitle("ESCRIBIR UNA RESEÑA", for: .normal)
        writeReviewButton.titleLabel?.font = .getOswaldMedium(ofSize: 15)
        writeReviewButton.titleLabel?.textColor = .white
        writeReviewButton.backgroundColor = .black
        
        seeReviewsButton.imageView?.image = .moreUIVCNext
        seeReviewsButton.imageView?.contentMode = .scaleAspectFit
        
    }
}
