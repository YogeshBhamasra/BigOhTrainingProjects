//
//  ZipCodeVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 24/02/23.
//

import Foundation

import UIKit

protocol ZipCodeVCView: UIViewController {
    var zipcodeImageView: UIImageView! { get set }
    var zipcodeTextFieldLabel: UILabel! { get set }
    var zipcodeTitleLabel: UILabel! { get set }
    var zipcodeTextLabel: UILabel! { get set }
    var zipcodeTextField: CustomTextField! { get set }
    var zipcodeRegisterButton: UIButton! { get set }
    var spinner: UIActivityIndicatorView! { get set }
    var store: ZipCodeModel? { get set }
    var showAddressLabel: UILabel! { get set }
//    var popUpDialog: CustomPopUpView! { get set }
}

class ZipCodeVC: UIViewController, ZipCodeVCView {
    @IBOutlet weak var zipcodeImageView: UIImageView!
    @IBOutlet weak var zipcodeTitleLabel: UILabel!
    @IBOutlet weak var zipcodeTextLabel: UILabel!
    @IBOutlet weak var zipcodeTextField: CustomTextField!
    @IBOutlet weak var zipcodeRegisterButton: UIButton!
    @IBOutlet weak var zipcodeTextFieldLabel: UILabel!
    @IBOutlet weak var showAddressLabel: UILabel!
    
    var spinner: UIActivityIndicatorView! = UIActivityIndicatorView()
    
    var store: ZipCodeModel?
    
    
    var zipcodeUIVC: ObservableUIVC?
    var zipcodeVM: ObservableVM?

    override func viewDidLoad() {
        super.viewDidLoad()
        zipcodeUIVC?.setupUI()
    }
    
    class func instance() -> ZipCodeVC{
        let vc = Storyboard.onboarding.instanceOf(viewController: ZipCodeVC.self)!
        vc.zipcodeVM = ZipCodeVM()
        guard let VM = vc.zipcodeVM else { return vc }
        
        vc.zipcodeUIVC = ZipCodeUIVC(view: vc, viewModel: VM)
        
        return vc
    }

}
