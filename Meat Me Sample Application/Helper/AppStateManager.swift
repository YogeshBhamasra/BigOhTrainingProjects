//
//  APPStateManager.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 23/02/23.
//

import UIKit

enum AppState:Int {
    case onboarded = 0
    case notOnboarded = 1
}
class AppStateManager {
    static let appStateKey = "applicationState"
    static let shared = AppStateManager()
    var currentState:AppState {
        
        let state = UserDefaults.standard.value(forKey: AppStateManager.appStateKey)
        if state == nil {
            return AppState.notOnboarded
        } else {
            return AppState.onboarded
        }
    }
    
}
 
