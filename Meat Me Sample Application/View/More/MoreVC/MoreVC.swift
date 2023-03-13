//
//  MoreVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 07/03/23.
//

import UIKit

protocol MoreVCView: UIViewController {
    var howToBuyButton: UIButton! { get set }
    var ourHistoryButton: UIButton! { get set }
    var recipesButton: UIButton! { get set }
    var findYourStoreButton: UIButton! { get set }
    var billingButton: UIButton! { get set }
    var whyFrozenButton: UIButton! { get set }
    var grillometerButton: UIButton! { get set }
    var qrScanButton: UIButton! { get set }
    var balanceEnquiryButton: UIButton! { get set }
    var frequentQuestionsButton: UIButton! { get set }
    var jobBagButton: UIButton! { get set }
    var privacyNoticeButton: UIButton! { get set }
    var versionLabel: UILabel! { get set }
}

class MoreVC: UIViewController, MoreVCView {
    @IBOutlet weak var howToBuyButton: UIButton!
    @IBOutlet weak var ourHistoryButton: UIButton!
    @IBOutlet weak var recipesButton: UIButton!
    @IBOutlet weak var findYourStoreButton: UIButton!
    @IBOutlet weak var billingButton: UIButton!
    @IBOutlet weak var whyFrozenButton: UIButton!
    @IBOutlet weak var grillometerButton: UIButton!
    @IBOutlet weak var qrScanButton: UIButton!
    @IBOutlet weak var balanceEnquiryButton: UIButton!
    @IBOutlet weak var frequentQuestionsButton: UIButton!
    @IBOutlet weak var jobBagButton: UIButton!
    @IBOutlet weak var privacyNoticeButton: UIButton!
    @IBOutlet weak var versionLabel: UILabel!

    var moreVM: ObservableVM?
    var moreUIVC: ObservableUIVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        moreUIVC?.setupUI()
        
    }
    
    class func instance() -> MoreVC {
        let vc = Storyboard.onboarding.instanceOf(viewController: MoreVC.self)!
        vc.moreVM = MoreVM()
        guard let VM = vc.moreVM as? MoreVM else { return vc }
        vc.moreUIVC = MoreUIVC(view: vc, viewModel: VM)
        return vc
    }
}
