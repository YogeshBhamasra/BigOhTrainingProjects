//
//  SlideImagesCollectionTVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 06/03/23.
//

import UIKit

class SlideImagesCollectionTVC: UITableViewCell {
    @IBOutlet weak var promotionalImagesCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    static let identifier = "SlideImagesCollectionTVC"
    static func uiNib() -> UINib {
        return UINib(nibName: SlideImagesCollectionTVC.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
