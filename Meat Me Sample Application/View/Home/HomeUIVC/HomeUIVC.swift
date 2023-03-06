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
    
    
    
    init(view: HomeVCView, viewModel: ObservableVM) {
        self.view = view
        self.viewModel = viewModel
    }
    
    func setupUI() {
        view.view.backgroundColor = .systemGray4
        setNavigationBarItems()
        setSearchBar()
        setChangeZipcodeButton()
        setCollectionView()
        railCategoriesData()
        loadImagesInSlide()
        modifyPageControl()
        loadProductsInView()
        setTableView()
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
        
    }
    
    //MARK: - Setting Table View
    func setTableView() {
        view.homeTableView.register(HomeTVC.uiNib(),
                                    forCellReuseIdentifier: HomeTVC.identifier)
        view.homeTableView.register(RailCategoriesCVC.uiNib(),
                                    forCellReuseIdentifier: RailCategoriesCVC.identifier)
        view.homeTableView.register(SlideShowImagesCVC.uiNib(),
                                    forCellReuseIdentifier: SlideShowImagesCVC.identifier)
        view.homeTableView.register(DisplayProductsCVC.uiNib(),
                                    forCellReuseIdentifier: DisplayProductsCVC.identifier)
        
        view.homeTableView.delegate = self
        view.homeTableView.dataSource = self
    }
    
    
    // MARK: - Setting Zip Code Button
    func setChangeZipcodeButton() {
        view.changeZipcodeButton.backgroundColor = .white
        
        view.changeZipcodeButton.contentHorizontalAlignment = .center
        view.changeZipcodeButton.contentVerticalAlignment = .center
        
        
        let title = LocalisableString.HomeUIVC.changeZipcodeTitle.localised
        
        let attributedString = NSMutableAttributedString(string: title)
        let range = NSRange(location: 0, length: title.count)
        
        attributedString.addAttribute(.font, value: UIFont.getOswaldRegular(ofSize: 12), range: range)
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: range)
        
        view.changeZipcodeButton.setAttributedTitle(attributedString, for: .normal)
        
        let leadingImageView = UIImageView()
        leadingImageView.image = .homeDelivery
        leadingImageView.frame = CGRect(x: 0, y: (view.changeZipcodeButton.bounds.height / 2.5), width: 32, height: 9.5)
        leadingImageView.contentMode = .scaleAspectFill
        
        
        let trailingImageView = UIImageView()
        
        trailingImageView.image = .dropdown_arrow
        trailingImageView.frame = CGRect(x: view.view.frame.width - 25, y: (view.changeZipcodeButton.bounds.height / 2) - 3, width: 17.5, height: 9.5)
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
    
    //MARK: - Setting Up Page Control
    func modifyPageControl() {
        view.slideshowPageControl.layer.borderColor = UIColor.lightGray.cgColor
        view.slideshowPageControl.layer.borderWidth = 1.0
        
    }
    
    // MARK: - Setting Collection View Items
    func setCollectionView() {
        view.railCollectionView.backgroundColor = .systemGray4
        view.railCollectionView.register(RailCategoriesCVC.uiNib(), forCellWithReuseIdentifier: RailCategoriesCVC.identifier)
        view.railCollectionView.delegate = self
        view.railCollectionView.dataSource = self
        
        view.slideShowImageCollectionView.register(SlideShowImagesCVC.uiNib(), forCellWithReuseIdentifier: SlideShowImagesCVC.identifier)
        view.slideShowImageCollectionView.dataSource = self
        view.slideShowImageCollectionView.delegate = self
        
        view.showProductsCollectionView.register(DisplayProductsCVC.uiNib(), forCellWithReuseIdentifier: DisplayProductsCVC.identifier)
        view.showProductsCollectionView.dataSource = self
        view.showProductsCollectionView.delegate = self
        
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
        
        VM.railImageDataDownloaded.bind { [weak self] data in
            guard let data else { return }
            self?.view.railImageData.append(data)
            HomeTVC.railCategoriesImagesData.append(data)
            DispatchQueue.main.async {
                self?.view.railCollectionView.reloadData()
            }
        }
    }
    
    //MARK: - Load Images in Slide Show
    func loadImagesInSlide() {
        guard let VM = viewModel as? HomeVM else { return }
        DispatchQueue.main.async {
            VM.loadSlideShowImages()
        }
        
        VM.slideShowImagesToShow.bind { [weak self] images in
            guard let images else { return }
            
            self?.view.slideshowImages = images
            DispatchQueue.main.async {
                self?.view.slideShowImageCollectionView.reloadData()
            }
        }
    }
    
    //MARK: - Load Products in View
    func loadProductsInView() {
        guard let VM = viewModel as? HomeVM else { return }
        
        DispatchQueue.main.async {
            VM.loadProducts()
        }
        
        VM.availableProductsData.bind { [weak self] product in
            guard let product else { return }
            
            self?.view.availableProducts = product
            DispatchQueue.main.async {
                self?.view.showProductsCollectionView.reloadData()
            }
        }
        
        VM.homePageData.bind { [weak self] result in
            guard let result else { return }
            
            self?.view.cellData.append(result)
            HomeTVC.models.append(result)
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
}

extension HomeUIVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return view.cellData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch view.cellData[section] {
            
        case .railCategory(model: _):
            return 1
        case .products(model: let model, rows: _):
            return model.count
        case .images(image: _):
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTVC.identifier) as? HomeTVC
        guard let cell else { return HomeTVC() }
        switch view.cellData[indexPath.section] {
            
        case .railCategory(model: let model):
            let category = model[indexPath.row]
            cell.customCollectionView.register(RailCategoriesCVC.uiNib(), forCellWithReuseIdentifier: RailCategoriesCVC.identifier)
            return cell
            
        case .products(model: let models, rows: _):
            let model = models[indexPath.row]
            cell.customCollectionView.register(DisplayProductsCVC.uiNib(), forCellWithReuseIdentifier: DisplayProductsCVC.identifier)
            return cell
            
            
        case .images(image: let images):
            let image = images[indexPath.row]
            cell.customCollectionView.register(SlideShowImagesCVC.uiNib(), forCellWithReuseIdentifier: SlideShowImagesCVC.identifier)
            return cell
        }
        
    }
    
    
}

//MARK: - Collection View Data Source and Delegate
extension HomeUIVC: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let visibleRect = CGRect(origin: self.view.slideShowImageCollectionView.contentOffset, size: self.view.slideShowImageCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.view.slideShowImageCollectionView.indexPathForItem(at: visiblePoint) {
            self.view.slideshowPageControl.currentPage = visibleIndexPath.row
        }
        
    }
}

extension HomeUIVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == view.railCollectionView {
            return view.railImageData.count
        } else if collectionView == view.slideShowImageCollectionView {
            view.slideshowPageControl.numberOfPages = view.slideshowImages.count
            return view.slideshowImages.count
        } else if collectionView == view.showProductsCollectionView {
//            return view.availableProducts.count
            return 10
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == view.railCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RailCategoriesCVC.identifier, for: indexPath) as? RailCategoriesCVC
            guard let cell else { return RailCategoriesCVC()}
            
            let category = view.railCategories[indexPath.row]
            let dataForImage = view.railImageData[indexPath.row]
            let image = UIImage(data: dataForImage)
            
            let font = UIFont.getMontserratRegular(ofSize: 12)
            cell.setupCell(image: image, text: category.name, font: font)
            
            return cell
        }
        else if collectionView == view.slideShowImageCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideShowImagesCVC.identifier, for: indexPath) as? SlideShowImagesCVC
            guard let cell else { return SlideShowImagesCVC()}
            let image = view.slideshowImages[indexPath.row]
            cell.setupImage(image: image, frame: view.slideShowImageCollectionView.frame)
            return cell
        }
        else if collectionView == view.showProductsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DisplayProductsCVC.identifier, for: indexPath) as? DisplayProductsCVC
            guard let cell else { return DisplayProductsCVC() }
            if view.availableProducts.count > 0 {
                let product = view.availableProducts[0]
                cell.setupCell(product: product)
            }
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension HomeUIVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        if collectionView == view.slideShowImageCollectionView {
//            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
//        }
//        else if collectionView == view.railCollectionView {
//            let width = collectionView.cellForItem(at: indexPath)?.bounds.width ?? 84
//            let height = collectionView.cellForItem(at: indexPath)?.bounds.height ?? 181
//            return CGSize(width: width, height: height)
//        }
//        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
//    }
//
    
}
