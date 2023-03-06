//
//  OnboardingModel.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 23/02/23.
//

import UIKit

class OnboardingViewModel: NSObject, ObservableVM {
    var error: Observable<String?> = Observable(nil)
    var result: Observable<Images?> = Observable(nil)
    
    func fetchData() {
        result.value = [
            OnboardingImage(image: .illustrations_1 ?? UIImage(),
                            title: LocalisableString.OnboardingCVC.title1.localised,
                            body: LocalisableString.OnboardingCVC.body1.localised),
            OnboardingImage(image: .illustrations_2 ?? UIImage(),
                            title: LocalisableString.OnboardingCVC.title2.localised,
                            body: LocalisableString.OnboardingCVC.body2.localised),
            OnboardingImage(image: .illustrations_3 ?? UIImage(),
                            title: LocalisableString.OnboardingCVC.title3.localised,
                            body: LocalisableString.OnboardingCVC.body3.localised)
        ]
    }
    
}
