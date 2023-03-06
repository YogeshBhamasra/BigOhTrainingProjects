//
//  CustomPopUpView.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 28/02/23.
//

import UIKit

class CustomPopUpView: UIView {
    static let identifier = "CustomPopUpView"

    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var SubTitle: UILabel!
    @IBOutlet weak var textFieldLabel: UILabel!
    @IBOutlet weak var textField: CustomTextField!
    @IBOutlet weak var notifyButton: UIButton!
    @IBOutlet weak var changeZipCodeButton: UIButton!
    @IBOutlet weak var closeButton:UIButton!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPopUp(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func loadXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: CustomPopUpView.identifier, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        
        return view!
    }
    
    func setupPopUp(frame: CGRect) {
        let view = loadXib()
        view.frame = frame
        addSubview(view)
    }
}
