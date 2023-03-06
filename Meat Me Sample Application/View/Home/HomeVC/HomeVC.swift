//
//  HomeVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 02/03/23.
//

import UIKit

protocol HomeVCView: UIViewController {
    var searchField: CustomSearchBar! { get set }
    var railCategories: [CategoryModel] { get set }
    var changeZipcodeButton: UIButton! { get set }
    var railCollectionView: UICollectionView! { get set }
    var railImageData: [Data] { get set }
    
    var homeTableView: UITableView! { get set }
    
    var slideShowImageCollectionView: UICollectionView! { get set }
    var slideshowImages: [UIImage] { get set }
    
    var showProductsCollectionView: UICollectionView! { get set }
    var availableProducts: Products { get set }
    
    var cellData: [CellType] { get set }
    
    var slideshowPageControl: UIPageControl! { get set }
}

class HomeVC: UIViewController, HomeVCView {
    @IBOutlet weak var searchField: CustomSearchBar!
    @IBOutlet weak var changeZipcodeButton: UIButton!
    @IBOutlet weak var railCollectionView: UICollectionView!
    @IBOutlet weak var slideShowImageCollectionView: UICollectionView!
    @IBOutlet weak var slideshowPageControl: UIPageControl!
    @IBOutlet weak var showProductsCollectionView: UICollectionView!
    @IBOutlet weak var homeTableView: UITableView!
    
    var railCategories: [CategoryModel] = []
    var railImageData: [Data] = []
    var slideshowImages: [UIImage] = []
    var availableProducts: Products = []
    var cellData: [CellType] = []
    
    var homeUIVC: ObservableUIVC?
    var homeModel: ObservableVM?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        homeUIVC?.setupUI()
    }
    
    class func instance() -> HomeVC {
        let vc = Storyboard.onboarding.instanceOf(viewController: HomeVC.self)!
        vc.homeModel = HomeVM()
        guard let VM = vc.homeModel as? HomeVM else { return vc }
        vc.homeUIVC = HomeUIVC(view: vc, viewModel: VM)
        
        return vc
    }
}
