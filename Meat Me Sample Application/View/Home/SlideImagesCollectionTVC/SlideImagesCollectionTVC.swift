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
    
    var imagesCollection: [UIImage] = []
    
    static let identifier = "SlideImagesCollectionTVC"
    static func uiNib() -> UINib {
        return UINib(nibName: SlideImagesCollectionTVC.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        promotionalImagesCollection.register(SlideShowImagesCVC.uiNib(), forCellWithReuseIdentifier: SlideShowImagesCVC.identifier)
        setupPageControl(number: 1)
        
        promotionalImagesCollection.delegate = self
        promotionalImagesCollection.dataSource = self
        promotionalImagesCollection.backgroundColor = .systemGray4
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupPageControl(number: Int) {
        pageControl.numberOfPages = number
        pageControl.backgroundColor = .systemBackground
    }
    
    func setupCell(model: [UIImage]){
        self.imagesCollection = model
        setupPageControl(number: model.count)
        promotionalImagesCollection.reloadData()
    }
    
}

extension SlideImagesCollectionTVC: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let visibleRect = CGRect(origin: promotionalImagesCollection.contentOffset, size: promotionalImagesCollection.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = promotionalImagesCollection.indexPathForItem(at: visiblePoint) {
            pageControl.currentPage = visibleIndexPath.row
        }
        
    }
    
    
}

extension SlideImagesCollectionTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideShowImagesCVC.identifier, for: indexPath) as? SlideShowImagesCVC
        guard let cell else { return SlideShowImagesCVC() }
        cell.setupImage(image: imagesCollection[indexPath.row], frame: CGRect(x: 0, y: 0, width: super.frame.width, height: super.frame.size.height))
        cell.backgroundColor = .clear
        return cell
    }
    
    
}

extension SlideImagesCollectionTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: super.frame.width, height: super.frame.height - 15)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
