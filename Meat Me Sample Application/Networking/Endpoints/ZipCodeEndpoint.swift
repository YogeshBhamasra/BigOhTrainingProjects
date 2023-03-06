//
//  ZipCodeEndpoint.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 27/02/23.
//

import Foundation
import Moya

enum ZipCodeEndpoint {
    case getZipCode(zipcode: Int, distance: Int)
}

extension ZipCodeEndpoint: TargetType {
    var baseURL: URL {
    
        switch self {
            
        case .getZipCode:
            return URL(string: "https://wildfork.mx")!
        }
    }
    
    var path: String {
        switch self {
            
        case .getZipCode:
            return "/apps/meat-me/locate_store"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .getZipCode:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case let .getZipCode(zipcode, distance):
            return .requestParameters(parameters: ["zip_code" : zipcode , "distance" : distance], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
            
        case .getZipCode:
            return MoyaAPIManager.httpHeader
        }
    }
    
    
}
