//
//  SplashUIVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 22/02/23.
//

import UIKit

class SplashUIVC: NSObject, ObservableUIVC {
    
    var viewModel: ObservableVM
    var view: SplashVCView
    
    init(view: SplashVCView, viewModel: ObservableVM) {
        self.view = view
        self.viewModel = viewModel
    }
    
    func setupUI() {
        animate()
        sendToView()
    }
    
    func sendToView() {
        guard let viewModel = viewModel as? SplashVM else { return }
        viewModel.fetchData()
        
        viewModel.result.bind { vc in
            guard let vc else { return }
            
            let nav = UINavigationController(rootViewController: vc)
            AppDelegate.shared().window?.rootViewController = nav
            AppDelegate.shared().window?.makeKeyAndVisible()
            
            
//            self.view.navigationController?.setViewControllers([vc], animated: true)
        }
    }
    
    func animate() {
        UIView.animate(withDuration: 1.5) {
    
            let size = self.view.view.frame.size.width * 5
            let x = size - self.view.view.frame.size.width
            let y = self.view.view.frame.size.height - size
            
            self.view.launchScreenImageView.image = UIImage(named: "trade mark")
            
            self.view.launchScreenImageView.frame = CGRect(x: -(x / 2),
                                          y: y / 2,
                                          width: size,
                                          height: size)
        }
        
        UIView.animate(withDuration: 2) {
            self.view.launchScreenImageView.alpha = 0
        }
    }
}


