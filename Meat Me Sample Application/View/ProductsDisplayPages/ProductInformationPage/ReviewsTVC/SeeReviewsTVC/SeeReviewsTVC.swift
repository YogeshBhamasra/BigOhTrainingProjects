//
//  SeeReviewsTVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 11/03/23.
//

import UIKit

class SeeReviewsTVC: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userVerifiedLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var reviewDescription: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var disLikeButton: UIButton!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var dislikeCount: UILabel!
    
    
    static let identifier = "SeeReviewsTVC"
    static func uiNib() -> UINib {
        return UINib(nibName: SeeReviewsTVC.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setFont()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        userImageView.image = nil
        shareButton.imageView?.image = nil
        likeButton.imageView?.image = nil
        disLikeButton.imageView?.image = nil
        userNameLabel.text = nil
        userVerifiedLabel.text = nil
        ratingLabel.text = nil
        topicLabel.text = nil
        reviewDescription.text = nil
        dateLabel.text = nil
        likeCount.text = nil
        dislikeCount.text = nil
    }
    
    func setupCell(model: ReviewsModel?) {
        userImageView.image = UIImage(data: model?.avatarImage ?? Data())
        shareButton.imageView?.image = .share
        likeButton.imageView?.image = .like
        disLikeButton.imageView?.image = .dislike
        
        userNameLabel.text = model?.userName
        let underlinedText = UnderlinedLabel()
        underlinedText.text = model?.userVerified
        userVerifiedLabel.attributedText = underlinedText.attributedText
        ratingLabel.text = model?.rating
        topicLabel.text = model?.topic
        reviewDescription.text = model?.reviewInBrief
        let formattor = DateFormatter()
        formattor.dateFormat = "MM/dd/yyyy"
        let date = formattor.string(from: model!.dateOfReview)
        dateLabel.text = date
        likeCount.text = "\(model?.numberOfLikes ?? 0)"
        dislikeCount.text = "\(model?.numberOfDislikes ?? 0)"
        
    }
    
    func setFont() {
        userNameLabel.font = .getOswaldSemiBold(ofSize: 14)
        userNameLabel.textColor = .black.withAlphaComponent(0.78)
        
        userVerifiedLabel.font = .getOswaldRegular(ofSize: 14)
        userVerifiedLabel.textColor = .black.withAlphaComponent(0.78)
        
        ratingLabel.font = .getOswaldRegular(ofSize: 12)
        ratingLabel.textColor = .black.withAlphaComponent(0.78)
        
        topicLabel.font = .getOswaldSemiBold(ofSize: 14)
        topicLabel.textColor = .black.withAlphaComponent(0.78)
        
        reviewDescription.font = .getMontserratRegular(ofSize: 16)
        reviewDescription.textColor = .black.withAlphaComponent(0.78)
        
        dateLabel.font = .getOswaldSemiBold(ofSize: 14)
        dateLabel.textColor = .black.withAlphaComponent(0.78)
        
        likeCount.font = .getOswaldRegular(ofSize: 14)
        likeCount.textColor = .black.withAlphaComponent(0.78)
        
        dislikeCount.font = .getOswaldRegular(ofSize: 14)
        dislikeCount.textColor = .black.withAlphaComponent(0.78)
    }
}
