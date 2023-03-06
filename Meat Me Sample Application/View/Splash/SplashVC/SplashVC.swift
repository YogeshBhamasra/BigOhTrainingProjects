//
//  SplashVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 22/02/23.
//

import UIKit

protocol SplashVCView: UIViewController {
    var launchScreenImageView: UIImageView! { get set }
}

class SplashVC: UIViewController, SplashVCView {
    
    @IBOutlet weak var launchScreenImageView: UIImageView!

    
    var splashVM: ObservableVM?
    var splashUIVC: ObservableUIVC?

    override func viewDidLoad() {
        super.viewDidLoad()
        splashVM = SplashVM()
        guard let VM = splashVM as? SplashVM else { return }
        
        splashUIVC = SplashUIVC(view: self, viewModel: VM)
        splashUIVC?.setupUI()

    }
    

}
