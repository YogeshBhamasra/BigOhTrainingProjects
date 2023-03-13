//
//  UINavigation+StoryBoard.swift
//  MVVM Example
//
//  Created by Yogesh Rao on 15/02/23.
//

import UIKit
import Foundation

enum Storyboard: String {
    case main = "Main"
    case splash = "Splash"
    case onboarding = "Onboarding"
    case more = "More"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
        
    }
    func instanceOf<T: UIViewController>(viewController: T.Type) -> T? {
        let x = String(describing: viewController.self)
        let vc = instance.instantiateViewController(withIdentifier: x) as? T
        vc?.modalPresentationStyle = .fullScreen
        return vc
        
    }
    
}
