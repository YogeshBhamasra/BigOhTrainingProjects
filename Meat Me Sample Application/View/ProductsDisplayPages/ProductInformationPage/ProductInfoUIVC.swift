//
//  ProductInfoUIVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 11/03/23.
//

import UIKit

class ProductInfoUIVC: NSObject, ObservableUIVC {
     unowned  var view: ProductInfoView
    unowned var viewModel: ObservableVM
    //var dict:[Int:CGFloat] = []
    
    init(view: ProductInfoView, viewModel: ObservableVM) {
        self.view = view
        self.viewModel = viewModel
    }
   
    
   func setupUI() {
        setNavigationController()
        setupTableView()
        fillData()
        binding()
    }
    
    private func setNavigationController() {
        view.title = "Details"
        
        view.navigationItem.rightBarButtonItems = [
            .init(image: .homeCart, style: .plain, target: self, action: .none),
            .init(title: "$0.00", style: .plain, target: self, action: .none)
        ]
        
    }
    
    func setupTableView() {
        view.productTable.register(SlideImagesCollectionTVC.uiNib(), forCellReuseIdentifier: SlideImagesCollectionTVC.identifier)
        view.productTable.register(ProductPriceTVC.uiNib(), forCellReuseIdentifier: ProductPriceTVC.identifier)
        view.productTable.register(ProductDescriptionTVC.uiNib(), forCellReuseIdentifier: ProductDescriptionTVC.identifier)
        view.productTable.register(ProductImagesTVC.uiNib(), forCellReuseIdentifier: ProductImagesTVC.identifier)
        view.productTable.register(EnterReviewTVC.uiNib(), forCellReuseIdentifier: EnterReviewTVC.identifier)
        view.productTable.register(SeeReviewsTVC.uiNib(), forCellReuseIdentifier: SeeReviewsTVC.identifier)
        
        view.productTable.delegate = self
        view.productTable.dataSource = self
        view.productTable.backgroundColor = .mySurfaceBackground
    }
    
    func fillData() {
        DispatchQueue.main.async {
            self.viewModel.fetchData()
        }
    }
    
    func binding() {
        guard let VM = viewModel as? ProductInfoVM else { return }
        VM.result.bind { [weak self] product in
            self?.view.productData = product
            self?.view.productTable.reloadData()
        }
    }
}

extension ProductInfoUIVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(400)
        } else if indexPath.section == 1 {
            return CGFloat(254)
        } else if indexPath.section == 2 {
            return CGFloat(370)
        } else if indexPath.section == 3 {
            return CGFloat(440)
        } else if indexPath.section == 4 {
            return CGFloat(220)
        }
        return CGFloat(350)
    }
}

extension ProductInfoUIVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 5 {
            return view.productData?.reviews?.count ?? 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SlideImagesCollectionTVC.identifier, for: indexPath) as? SlideImagesCollectionTVC
            guard let cell else { return SlideImagesCollectionTVC() }
            let image = UIImage(data: view.productDetails!.productImage)!
            cell.setupCell(model: [image, image, image])
            cell.backgroundColor = .mySurfaceBackground
            
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductPriceTVC.identifier, for: indexPath) as? ProductPriceTVC
            guard let cell else { return ProductPriceTVC() }
            cell.setupCellButton(font: .getOswaldMedium(ofSize: 15), textColor: .white, bacgroundColor: .black, title: LocalisableString.ProductCollectionTVC.addToCartWithZip.localised)
            cell.setupCell(product: view.productDetails!)
            cell.backgroundColor = .mySurfaceBackground
            
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDescriptionTVC.identifier, for: indexPath) as? ProductDescriptionTVC
            guard let cell else { return ProductDescriptionTVC() }
            let model = view.productData?.productDescription
            cell.setupCell(model: model)

            
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductImagesTVC.identifier, for: indexPath) as? ProductImagesTVC
            guard let cell else { return ProductImagesTVC() }
            let model = view.productData?.recipeImagesWithText

            cell.setupCell(model: model)
            cell.backgroundColor = .mySurfaceBackground
            
            return cell
        } else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EnterReviewTVC.identifier, for: indexPath) as? EnterReviewTVC
            guard let cell else { return EnterReviewTVC() }

            cell.setupCell()
            cell.backgroundColor = .mySurfaceBackground
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SeeReviewsTVC.identifier, for: indexPath) as? SeeReviewsTVC
            guard let cell else { return SeeReviewsTVC() }
            let model = view.productData?.reviews?[indexPath.row]
    
            cell.setupCell(model: model)
            tableView.separatorColor = .clear
            cell.contentView.backgroundColor = .mySurfaceBackground
            
            return cell
        }
    }
    
    
}


