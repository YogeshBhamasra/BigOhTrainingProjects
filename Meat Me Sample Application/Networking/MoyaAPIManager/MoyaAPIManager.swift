//
//  MoyaAPIManager.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 27/02/23.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<ZipCodeEndpoint> { get }
    func fetchData(zipcode: Int, completion: @escaping (ZipCodeModel?, Error?) -> ())
}

class MoyaAPIManager: Networkable {
    var provider = MoyaProvider<ZipCodeEndpoint>()
    
    static let shared = MoyaAPIManager()
    static var httpHeader: [String : String] {
        ["Content-Type" : "application/json"]
    }
    
    private init() {}
    
    func fetchData(zipcode: Int, completion: @escaping (ZipCodeModel?, Error?) -> ()) {
        provider.request(.getZipCode(zipcode: zipcode, distance: 20)) { result in
            switch result {
                
            case .success(let response):
                do {
                    if 200...299 ~= response.statusCode {
                        let data = try JSONDecoder().decode(ZipCodeModel.self, from: response.data)
                        completion(data, nil)
                    } else {
                        completion(nil, errno_t() as? Error)
                    }
                    
                    
                } catch {
                    debugPrint(error)
                    completion(nil, error)
                }
            case .failure(let error):
                debugPrint(error)
                completion(nil, error)
            }
        }
    }
    
    func downloadImage(from url: URL, completion: @escaping (Data?, Error?) -> ()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data, error == nil else {
                completion(nil, error)
                return
            }
            
            completion(data, nil)
            
        }.resume()
        
    }
}
