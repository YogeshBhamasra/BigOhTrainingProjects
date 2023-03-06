//
//  PopUpVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 28/02/23.
//

import UIKit

protocol PopUpVCView: UIViewController {
    var titleLabel: UILabel! { get set }
    var subTitle: UILabel! { get set }
    var textFieldLabel: UILabel! { get set }
    var textField: CustomTextField! { get set }
    var notifyButton: UIButton! { get set }
    var changeZipCodeButton: UIButton! { get set }
    var closeButton:UIButton! { get set }
    var popView: UIView! { get set }
}

class PopUpVC: UIViewController, PopUpVCView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var textFieldLabel: UILabel!
    @IBOutlet weak var textField: CustomTextField!
    @IBOutlet weak var notifyButton: UIButton!
    @IBOutlet weak var changeZipCodeButton: UIButton!
    @IBOutlet weak var closeButton:UIButton!
    @IBOutlet weak var popView: UIView!
    
    var popUpVM: ObservableVM?
    var popUpUIVC: ObservableUIVC?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        popUpUIVC?.setupUI()
        
    
    }
    
    class func instance() -> PopUpVC {
        let vc = Storyboard.onboarding.instanceOf(viewController: PopUpVC.self)!
        vc.modalPresentationStyle = .overCurrentContext
        vc.preferredContentSize = .init(width: 380, height: 486)
        
        vc.popUpVM = PopUpVM()
        guard let VM = vc.popUpVM as? PopUpVM else { return vc }
        
        vc.popUpUIVC = PopUpUIVC(view: vc, viewModel: VM)
        
        return vc
    }
    
    
    
    
}
