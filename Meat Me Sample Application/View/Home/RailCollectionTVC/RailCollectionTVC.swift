//
//  RailCollectionTVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 06/03/23.
//

import UIKit

class RailCollectionTVC: UITableViewCell {
    
    @IBOutlet weak var railCollectionView: UICollectionView!
    
    static let identifier = "RailCollectionTVC"
    static func uiNib() -> UINib {
        return UINib(nibName: RailCollectionTVC.identifier, bundle: nil)
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
