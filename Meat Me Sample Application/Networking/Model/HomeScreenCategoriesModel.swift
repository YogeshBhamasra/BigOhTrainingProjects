//
//  HomeScreenCategoriesModel.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 01/03/23.
//

import Foundation

// MARK: - Welcome
struct Category: Codable {
    let categoryArray: [CategoryModel]
    enum CodingKeys: String, CodingKey {
        case categoryArray = "value"
    }
}

// MARK: - Value
struct CategoryModel: Codable {
    let name, handle: String
    let imageurl: String
    let subcategories: [Subcategory]
    enum CodingKeys: CodingKey {
        case name
        case handle
        case imageurl
        case subcategories
    }
}

// MARK: - Subcategory
struct Subcategory: Codable {
    let name, handle: String
    enum CodingKeys: CodingKey {
        case name
        case handle
    }
}

//typealias Categories = [Category]
