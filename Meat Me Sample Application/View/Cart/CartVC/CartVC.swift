//
//  CartVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 09/03/23.
//

import UIKit

protocol CartVCView: UIViewController {
    
}

class CartVC: UIViewController, CartVCView {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    class func instance() -> CartVC {
        let vc = Storyboard.onboarding.instanceOf(viewController: CartVC.self)!
        
        return vc
    }

}
