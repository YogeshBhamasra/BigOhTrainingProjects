//
//  HomeUIVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 02/03/23.
//

import UIKit

class HomeUIVC: NSObject, ObservableUIVC {
    var view: HomeVCView
    var viewModel: ObservableVM
    
    
    var railCell: RailCollectionTVC?
    var productCell: ProductsCollectionTVC?
    var imageCell: SlideImagesCollectionTVC?
    
    init(view: HomeVCView, viewModel: ObservableVM) {
        self.view = view
        self.viewModel = viewModel
    }
    
    func setupUI() {
        setNavigationBarItems()
        setSearchBar()
        setChangeZipcodeButton()
        railCategoriesData()
        setTableView()
        view.navigationController?.navigationBar.backgroundColor = .white
    }

 
    // MARK: - Setting Navigation Bar Items
    func setNavigationBarItems() {
        view.navigationController?.navigationBar.tintColor = .black
        view.navigationController?.navigationBar.backgroundColor = .systemBackground
        let size = CGSize(width: 108, height: 20)
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { context in
            UIImage.trade_mark?.draw(in: CGRect(origin: .zero, size: size))
        }
        let imageView = UIImageView(image: image)
        let leftImage = UIBarButtonItem(customView: imageView)
        
        view.navigationItem.leftBarButtonItem = leftImage
        view.navigationItem.leftBarButtonItem?.action = .none
        
        view.navigationItem.rightBarButtonItems = [
            .init(image: .homeCart, style: .plain, target: self, action: .none),
            .init(title: "$ 0.00", style: .plain, target: self, action: .none)
        ]
    }
    
    
    // MARK: - Setting Search Bar
    func setSearchBar() {

        view.searchField.setImage(image: .search_icon)
        view.searchField.setFont(myFont: .getMontserratRegular(ofSize: 16))
        view.searchField.setKeyboardType(type: .webSearch)
        view.searchField.setPlaceholder(placeholderText: LocalisableString.HomeUIVC.searchBarPlaceholder.localised)
        view.searchField.setBackgroundColor(color: .mySurfaceBackground)
    }
    
    //MARK: - Setting Table View
    func setTableView() {
        view.homeTableView.register(RailCollectionTVC.uiNib(),
                                    forCellReuseIdentifier: RailCollectionTVC.identifier)
        view.homeTableView.register(SlideImagesCollectionTVC.uiNib(),
                                    forCellReuseIdentifier: SlideImagesCollectionTVC.identifier)
        view.homeTableView.register(ProductsCollectionTVC.uiNib(),
                                    forCellReuseIdentifier: ProductsCollectionTVC.identifier)
        
        view.homeTableView.delegate = self
        view.homeTableView.dataSource = self
        
        
    }
    
    
    // MARK: - Setting Zip Code Button
    func setChangeZipcodeButton() {
        view.changeZipcodeButton.backgroundColor = .white
        
        view.changeZipcodeButton.contentHorizontalAlignment = .center
        view.changeZipcodeButton.contentVerticalAlignment = .center
        view.changeZipcodeButton.layer.borderWidth = 0.5
        view.changeZipcodeButton.layer.borderColor = UIColor.black.withAlphaComponent(0.6).cgColor
        
        let title = LocalisableString.HomeUIVC.changeZipcodeTitle.localised
        
        let attributedString = NSMutableAttributedString(string: title)
        let range = NSRange(location: 0, length: title.count)
        
        attributedString.addAttribute(.font, value: UIFont.getOswaldRegular(ofSize: 12), range: range)
        attributedString.addAttribute(.foregroundColor, value: UIColor.black.withAlphaComponent(0.78), range: range)
        
        view.changeZipcodeButton.setAttributedTitle(attributedString, for: .normal)
        
        let leadingImageView = UIImageView()
        leadingImageView.image = .homeDelivery
        leadingImageView.frame = CGRect(x: 0, y: (view.changeZipcodeButton.bounds.height / 2.5), width: 32, height: 9.5)
        leadingImageView.contentMode = .scaleAspectFill
        
        
        let trailingImageView = UIImageView()
        
        trailingImageView.image = .dropdown_arrow
        trailingImageView.frame = CGRect(x: view.view.frame.width - 25, y: (view.changeZipcodeButton.bounds.height / 2) - 3, width: 17.5, height: 9.5)
        trailingImageView.tintColor = .black
        trailingImageView.contentMode = .center
        trailingImageView.contentMode = .scaleAspectFill
        
//        let trailingAttachement = NSTextAttachment()
//        trailingAttachement.image = .dropdown_arrow
//        trailingAttachement.bounds = trailingImageView.bounds
//
//        attributedString.insert(NSAttributedString(string: " "), at: range.length)
//        attributedString.insert(NSAttributedString(attachment: trailingAttachement), at: range.length)
        
        view.changeZipcodeButton.addSubview(leadingImageView)
        view.changeZipcodeButton.addSubview(trailingImageView)
        
    }

    
    
    //MARK: - Load Rail Categories with Data
    func railCategoriesData() {
        guard let VM = viewModel as? HomeVM else { return }
        
        DispatchQueue.main.async {
            VM.fetchData()
        }
        
        VM.railCategories.bind { [weak self] category in
            guard let category else { return }
            self?.view.railCategories = category.categoryArray
            for value in self?.view.railCategories ?? [] {
                let url = URL(string: value.imageurl)!
                VM.downloadImage(url: url)
            }
            
        }
        
        VM.homePageData.bind { [weak self] result in
            guard let result else { return }
            self?.view.cellData.append(result)
            switch result {
                
            case .railCategory(model: let model):
                self?.view.railCategories = model
            case .products(model: let model, rows: _):
                self?.view.productsData = model
            case .images(image: let image):
                self?.view.slideShowImagesData = image
            }
            
            
            
        }

        
        VM.railImageDataDownloaded.bind { [weak self] data in
            guard let data else { return }
            self?.view.railImageData.append(data)
            DispatchQueue.main.async {
                self?.view.homeTableView.reloadData()
            }
        }
    }

}

//MARK: - Table View Data Source and Delegate
extension HomeUIVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return CGFloat(110)
        } else if indexPath.section == 1 {
            return CGFloat(255)
        } else {
            return CGFloat(410)
        }
    }
}

extension HomeUIVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return view.cellData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch view.cellData[section] {
            
        case .railCategory(model: _):
            return 1
        case .products(model: _ , rows: let rows):
            debugPrint(rows)
            return 1
        case .images(image: _):
            return 1
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Use HashMap
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RailCollectionTVC.identifier) as? RailCollectionTVC
            guard let cell else { return RailCollectionTVC() }
            cell.setupCell(model: view.railCategories, imagesData: view.railImageData)
            cell.backgroundColor = .mySurfaceBackground
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SlideImagesCollectionTVC.identifier) as? SlideImagesCollectionTVC

            guard let cell else { return SlideImagesCollectionTVC() }
            cell.setupCell(model: view.slideShowImagesData)
            cell.backgroundColor = .mySurfaceBackground
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductsCollectionTVC.identifier) as? ProductsCollectionTVC

            guard let cell else { return ProductsCollectionTVC() }
            cell.setupCell(model: view.productsData)
            cell.delegate = self
            cell.backgroundColor = .mySurfaceBackground
            return cell
        }
    }
    
    
}

extension HomeUIVC: SelectedProductDelegate {
    func didSelectProduct(data: ProductDetails) {
        let vc = ProductInfoPageVC.instance(data: data)
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
}
