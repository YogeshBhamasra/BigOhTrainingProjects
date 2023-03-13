//
//  LoginVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 09/03/23.
//

import UIKit

protocol LoginVCView: UIViewController {
    var imageView: UIImageView! { get set }
    var titleLabel: UILabel! { get set }
    var emailField: UITextField! { get set }
    var passwordField: UITextField! { get set }
    var fogotPasswordButton: UIButton! { get set }
    var createAccountButton: UIButton! { get set }
    var loginButton: UIButton! { get set }
    var passwordFieldLabel: UILabel! { get set }
    var emailFieldLabel: UILabel! { get set }
}

class LoginVC: UIViewController, LoginVCView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailFieldLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordFieldLabel: UILabel!
    @IBOutlet weak var fogotPasswordButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var loginVM: ObservableVM?
    var loginUIVC: ObservableUIVC?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginUIVC?.setupUI()
    }
    
    class func instance() -> LoginVC {
        let vc = Storyboard.onboarding.instanceOf(viewController: LoginVC.self)!
        vc.loginVM = LoginVM()
        guard let VM = vc.loginVM as? LoginVM else { return vc }
        vc.loginUIVC = LoginUIVC(view: vc, viewModel: VM)
        return vc
    }
}
