//
//  TabBarVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 07/03/23.
//

import UIKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate {
    let home = UINavigationController(rootViewController: HomeVC.instance())
    let login = UINavigationController(rootViewController: LoginVC.instance())
    let cart = UINavigationController(rootViewController: CartVC.instance())
    let more = UINavigationController(rootViewController: MoreVC.instance())

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBar.backgroundColor = .systemGray6

        self.tabBar.tintColor = .red
//        self.tabBar.selectedItem?.badgeColor = .black
        self.tabBar.unselectedItemTintColor = UIColor.black
        self.navigationController?.isNavigationBarHidden = true
        self.viewControllers = [home, cart, login, more]
        setTabBarItems()
        addLayer()
        self.delegate = self
    }
    
    func addLayer() {
        let layer = CALayer()
        layer.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 1.0)
        layer.borderColor = UIColor.green.cgColor
        self.view.layer.addSublayer(layer)
    }
    
    func setTabBarItems() {
        home.tabBarItem = UITabBarItem(title: LocalisableString.TabBarVC.shopButtonTitle.localised,
                                       image: .tabBarShop, selectedImage: .none)
        cart.tabBarItem = UITabBarItem(title: LocalisableString.TabBarVC.cartButtonTitle.localised,
                                       image: .tabBarCart, selectedImage: .none)
        login.tabBarItem = UITabBarItem(title: LocalisableString.TabBarVC.accountButtonTitle.localised,
                                        image: .tabBarAccount, selectedImage: .none)
        more.tabBarItem = UITabBarItem(title: LocalisableString.TabBarVC.moreButtonTitle.localised,
                                       image: .tabBarMore, selectedImage: .none)
        
    }

}
