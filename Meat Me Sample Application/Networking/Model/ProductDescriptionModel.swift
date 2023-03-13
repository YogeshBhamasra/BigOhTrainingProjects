//
//  ProductDescriptionModel.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 13/03/23.
//

import UIKit
//MARK: - Models for Product Information Page
struct ProductModel: Codable {
    let productDetails: ProductDetails?
    let productImages: [Data]?
    let recipeImagesWithText: [RecipesImagesAndText]?
    let productDescription: ProductDescriptionModel?
    let reviews: [ReviewsModel]?
}

struct ProductDescriptionModel: Codable {
    let title: String
    let descriptionBody: String
    let infoLabels: [InfoWithWeight]
}

struct InfoWithWeight: Codable {
    let infoLabel: String
    let weightLabel: String
}

struct RecipesImagesAndText: Codable {
    let image: Data
    let text: String
}

struct ReviewsModel: Codable {
    let avatarImage: Data?
    let userName: String
    let userVerified: String
    let rating: String
    let topic: String
    let reviewInBrief: String
    let dateOfReview: Date
    let numberOfLikes: Int
    let numberOfDislikes: Int
}

