//
//  SplashModel.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 22/02/23.
//

import UIKit

class SplashVM: NSObject, ObservableVM {
    var error: Observable<String?> = Observable(nil)
    var result: Observable<UIViewController?> = Observable(nil)
    
    let stateManager = AppStateManager()
    
    func fetchData() {
        let appState = stateManager.currentState
        
        if appState == AppState.onboarded {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                let vc = ZipCodeVC.instance()
                let vc = HomeVC.instance()
                vc.modalTransitionStyle = .crossDissolve
                self.result.value = vc
                //                self.navigationController?.setViewControllers([vc], animated: true)
                
            }
        }
        else if appState == AppState.notOnboarded {
            UserDefaults.standard.set(0, forKey: "applicationState")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let vc = OnboardingVC.instance()
                self.result.value = vc
//                self.navigationController?.setViewControllers([vc], animated: true)
                debugPrint("Welcome to On Boarding")
            }
        }
        
    }

}
