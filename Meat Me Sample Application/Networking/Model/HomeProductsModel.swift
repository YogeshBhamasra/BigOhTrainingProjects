//
//  HomeProductsModel.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 03/03/23.
//

import UIKit

enum CellType{
    case railCategory(model: [CategoryModel])
    case products(model: Products, rows: Int)
    case images(image: [UIImage])
}

struct ProductDetails: Codable {
    let productImage: Data
    let previouslyOrderedImage: Data?
    let productName, rating, productWeight, numberOfPieces,productPrice, productPricePerKG, buttonTitle: String
    
    enum CodingKeys: CodingKey {
        case productImage
        case previouslyOrderedImage
        case productName
        case rating
        case productWeight
        case numberOfPieces
        case productPrice
        case productPricePerKG
        case buttonTitle
    }
}

typealias Products = [ProductDetails]
