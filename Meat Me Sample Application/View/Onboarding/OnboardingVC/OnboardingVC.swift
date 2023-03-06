//
//  OnboardingVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 23/02/23.
//

import UIKit

protocol OnboardingVCView: UIViewController {
    var pageControl: UIPageControl! { get set }
    var skipButton: UIButton! { get set }
    var nextButton: UIButton! { get set }
    
    var cellData: Images { get set }
    var currentIndex: Int { get set }
    var collectionView: UICollectionView! { get set }
}

class OnboardingVC: UIViewController, OnboardingVCView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var cellData: Images = []
    var currentIndex: Int = 0
    
    var onboardingUIVC: ObservableUIVC?
    var onboardingVM: ObservableVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        onboardingVM = OnboardingViewModel()
//        guard let VM = onboardingVM as? OnboardingViewModel else {
//            return
//        }
//        
//        onboardingUIVC = OnboardingUIVC(view: self, viewModel: VM)
        onboardingUIVC?.setupUI()
    }
    class func instance() -> OnboardingVC{
        let vc = Storyboard.onboarding.instanceOf(viewController: OnboardingVC.self)!
        vc.onboardingVM = OnboardingViewModel()
        guard let VM = vc.onboardingVM else { return vc }
        
        vc.onboardingUIVC = OnboardingUIVC(view: vc, viewModel: VM)
        return vc
    }
}
