//
//  ZipCodeModel.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 27/02/23.
//

import Foundation

// MARK: - Welcome
struct ZipCodeModel: Codable {
    let store: Store?
    let subscriptionEligible: Bool

    enum CodingKeys: String, CodingKey {
        case store
        case subscriptionEligible = "subscription_eligible"
    }
}

// MARK: - Store
struct Store: Codable {
    let id: Int
    let name: String
    let address: Address
    let location: Location
    let google360_URL: String
    let hours: [Hour]
    let distance: JSONNull?
    let shippingTypes: [String]
    let deliveryType: String
    let newStore: Bool

    enum CodingKeys: String, CodingKey {
        case id, name, address, location
        case google360_URL = "google_360_url"
        case hours, distance
        case shippingTypes = "shipping_types"
        case deliveryType = "delivery_type"
        case newStore = "new_store"
    }
}

// MARK: - Address
struct Address: Codable {
    let address1, address2, city, province: String
    let zipCode, country, phone: String

    enum CodingKeys: String, CodingKey {
        case address1, address2, city, province
        case zipCode = "zip_code"
        case country, phone
    }
}

// MARK: - Hour
struct Hour: Codable {
    let day, startTime, endTime: String
    let hourOpen: Bool

    enum CodingKeys: String, CodingKey {
        case day
        case startTime = "start_time"
        case endTime = "end_time"
        case hourOpen = "open"
    }
}

// MARK: - Location
struct Location: Codable {
    let latitude, longitude: Double
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
