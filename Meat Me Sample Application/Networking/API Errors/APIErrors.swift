//
//  APIErrors.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 27/02/23.
//

import Foundation

enum APIError: Error {
    case invalidUrl
    case invalidData
    case invalidResponse
    case network(Error?)
}
