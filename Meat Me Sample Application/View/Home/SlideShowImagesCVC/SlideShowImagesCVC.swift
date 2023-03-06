//
//  SlideShowImagesCVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 03/03/23.
//

import UIKit

class SlideShowImagesCVC: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "SlideShowImagesCVC"
    static func uiNib() -> UINib {
        return UINib(nibName: SlideShowImagesCVC.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        debugPrint(super.frame)
//        frame = CGRect(x: 0.0, y: 0.0, width: super.frame.width, height: super.frame.height)
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func setupImage(image: UIImage?, frame: CGRect) {

        imageView.frame = frame
        imageView.image = image ?? UIImage()
        imageView.contentMode = .scaleAspectFit
    }
    
    
}
