//
//  ZipCodeVM.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 24/02/23.
//

import UIKit

class ZipCodeVM: NSObject, ObservableVM {
    var error: Observable<String?> = Observable(nil)
    var result: Observable<ZipCodeModel?> = Observable(nil)
    static var zipcode: Int = 0
    
    func fetchData() {
        MoyaAPIManager.shared.fetchData(zipcode: ZipCodeVM.zipcode) { result, error  in
            if let result {
                self.result.value = result
            }
            else {
                debugPrint(error)
                self.result.value = nil
                
            }
            
        }
    }
}
