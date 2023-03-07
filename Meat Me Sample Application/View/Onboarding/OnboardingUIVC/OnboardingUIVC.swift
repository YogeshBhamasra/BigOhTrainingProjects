//
//  OnboardingUIVC.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 23/02/23.
//

import UIKit

class OnboardingUIVC: NSObject, ObservableUIVC {
    var view: OnboardingVCView
    var viewModel: ObservableVM
    
    
    
    init(view: OnboardingVCView, viewModel: ObservableVM) {
        self.view = view
        self.viewModel = viewModel
    }
    
    func setupUI() {
        registerCollection()
        setupCollection()
        fillData()
        setupOnboardingPageControl()
        setupOnboardingButtons()
    }
    
    func setupOnboardingButtons() {
        let underline = UnderlinedLabel()
        underline.text = LocalisableString.OnboardingVC.nextButtonTitle.localised
        view.nextButton.setAttributedTitle(underline.attributedText, for: .normal)
        
        let skipButtonTitle = LocalisableString.OnboardingVC.skipButtonTitle1.localised
        view.skipButton.setTitle(skipButtonTitle, for: .normal)
        
        view.nextButton.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
        view.skipButton.addTarget(self, action: #selector(skipOnboardingPage), for: .touchUpInside)
    }
    
    func setupOnboardingPageControl() {
        view.pageControl.addTarget(self, action: #selector(pageSelector), for: .touchUpInside)
        
    }
    
    @objc func pageSelector(_ sender: UIPageControl) {
        DispatchQueue.main.async{
            let current = CGFloat(sender.currentPage)
            self.setCollectionViewContentOffset(current)
        }
    }
    
    func setCollectionViewContentOffset(_ index: CGFloat) {
        let width = self.view.view.frame.size.width
        let xPosition = (index * width)
        self.view.collectionView.setContentOffset(CGPoint(x: xPosition, y: 0), animated: true)
//        self.view.collectionView.center = view.view.center
    }
    
    @objc func goToNextPage(_ sender: UIButton) {
        let index = view.pageControl.currentPage + 1
        if index == view.cellData.count {
            sender.isEnabled = false
            sender.isHidden = true
        }
        
        setCollectionViewContentOffset(CGFloat(index))
        
    }
    
    @objc func skipOnboardingPage(_ sender: UIButton) {
        let index = view.pageControl.currentPage
        let endIndex = view.cellData.count - 1
        if index == endIndex {
            let vc = ZipCodeVC.instance()
            view.navigationController?.setViewControllers([vc], animated: true)
        } else {
            
            setCollectionViewContentOffset(CGFloat(endIndex))
        }
    }
    
    func registerCollection() {
        view.collectionView.register(CustomCVC.uiNib(), forCellWithReuseIdentifier: CustomCVC.identifier)
    }
    
    func setupCollection() {
        view.collectionView.dataSource = self
        view.collectionView.delegate = self
        
        view.collectionView.isPagingEnabled = true
        view.collectionView.clipsToBounds = true
        
    }
    
    func fillData() {
        
        guard let viewModel = self.viewModel as? OnboardingViewModel else { return }
        DispatchQueue.main.async {
            viewModel.fetchData()
        }
        
        viewModel.result.bind { [weak self] imageData in
            if let imageData {
                self?.view.cellData = imageData
                self?.view.collectionView.reloadData()
                
            } else {
                debugPrint("No Data")
            }
        }
    }
}

extension OnboardingUIVC: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let visibleRect = CGRect(origin: self.view.collectionView.contentOffset, size: self.view.collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.view.collectionView.indexPathForItem(at: visiblePoint) {
            self.view.pageControl.currentPage = visibleIndexPath.row
        }
        
        view.currentIndex = view.pageControl.currentPage

        changeButtons(index: self.view.pageControl.currentPage)
    }
    
    func changeButtons(index: Int) {
        debugPrint(index)
        if index == view.cellData.count - 1 {
            view.nextButton.isHidden = true
            view.nextButton.isEnabled = false
            
            let title = LocalisableString.OnboardingVC.skipButtonTitle2.localised
            view.skipButton.setTitle(title, for: .normal)
        }
        else {
            view.nextButton.isHidden = false
            view.nextButton.isEnabled = true
            
            let title = LocalisableString.OnboardingVC.skipButtonTitle1.localised
            view.skipButton.setTitle(title, for: .normal)
        }
    }
    
}

extension OnboardingUIVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return view.cellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCVC.identifier, for: indexPath) as? CustomCVC
        guard let cell else { return CustomCVC() }
        let data = view.cellData[indexPath.row]

        cell.setupCell(image: data.image, title: data.title, body: data.body)
        
        return cell
    }
    
}

extension OnboardingUIVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

