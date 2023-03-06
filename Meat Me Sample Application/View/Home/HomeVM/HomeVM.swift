//
//  HomeVM.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 02/03/23.
//

import UIKit

class HomeVM: NSObject, ObservableVM {
    var error: Observable<String?> = Observable(nil)
    var railCategories: Observable<Category?> = Observable(nil)
    var railImageDataDownloaded: Observable<Data?> = Observable(nil)
    var slideShowImagesToShow: Observable<[UIImage]?> = Observable(nil)
    var availableProductsData: Observable<Products?> = Observable(nil)
    
    var homePageData: Observable<CellType?> = Observable(nil)
    
    func fetchData() {
        FirebaseManager.shared.configFirebase()
        FirebaseManager.remoteConfig.fetchAndActivate { [weak self] (status, error) in
            guard let weakSelf = self else { return }
            if let categories = FirebaseManager.remoteConfig.configValue(forKey: "categories").jsonValue as? [String: Any] {
                do {
                    
                    let data = try JSONSerialization.data(withJSONObject: categories)
                    let model = try JSONDecoder().decode(Category.self, from: data)
                    weakSelf.railCategories.value = model
                    weakSelf.homePageData.value = .railCategory(model: model.categoryArray)
                    
                } catch {
                    self?.error.value = error.localizedDescription
                    debugPrint(error)
                }
                
            }
        }
    }
    
    func downloadImage(url: URL) {
        MoyaAPIManager.shared.downloadImage(from: url) { [weak self] result, error in
            guard let weakSelf = self else { return }
            guard let result, error == nil else {
                weakSelf.railImageDataDownloaded.value = nil
                return
            }
            weakSelf.railImageDataDownloaded.value = result
            
        }
    }

    func loadSlideShowImages() {
        self.slideShowImagesToShow.value = [
            UIImage(named: "cart_icon")!,
            UIImage(named: "delivery_icon")!,
            UIImage(named: "onboarding_arrow")!,
            UIImage(named: "meatme es wildfotk")!
        ]
        self.homePageData.value = .images(image: self.slideShowImagesToShow.value ?? [])
    }
    
    func loadProducts() {
        self.availableProductsData.value = [
            ProductDetails(productImage: UIImage(named: "81021-mini-waffles-de-belgica-cocinado_900x900")!.pngData()!, previouslyOrderedImage: UIImage(named: "Previously Ordered")?.pngData(), productName: "TOP SIRLOIN DE RES BISTEC DE CORTE", rating: "rating (0)", productWeight: "0.375 KG", numberOfPieces: "1 pieza", productPrice: "$17.00", productPricePerKG: "$15.92/KG", buttonTitle: "CAMBIAR CÓDIGO POSTAL")
        ]
        
        self.homePageData.value = .products(model: self.availableProductsData.value ?? [], rows: 10)
    }
    
}
