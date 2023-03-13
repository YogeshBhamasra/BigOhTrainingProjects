//
//  ProductInfoPageVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 11/03/23.
//

import UIKit

protocol ProductInfoView: UIViewController {
    var productDetails: ProductDetails? { get set }
    var productTable: UITableView! { get set }
    var productData: ProductModel? { get set }
}

class ProductInfoPageVC: UIViewController, ProductInfoView {
    var productDetails: ProductDetails?
    var productData: ProductModel?
    
    @IBOutlet weak var productTable: UITableView!
    
    var productVM: ObservableVM?
    var productUIVC: ObservableUIVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        productUIVC?.setupUI()
    }
    deinit {
        print("Product vc Denit  ")
    }
    
    class func instance(data: ProductDetails) -> ProductInfoPageVC {
        let vc = Storyboard.onboarding.instanceOf(viewController: ProductInfoPageVC.self)!
        vc.productVM = ProductInfoVM()
        guard let VM = vc.productVM as? ProductInfoVM else { return vc }
        vc.productUIVC = ProductInfoUIVC(view: vc, viewModel: VM)
        vc.productDetails = data
        return vc
    }

}
