//
//  CustomView.swift
//  TestTask6
//
//  Created by Marcos Vicente on 02.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit
import LBTAComponents

@available(iOS 11.0, *)
class CustomView: UIView {
    
    let customLabel = UILabel()
    let anotherCustomLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCustomViewElements()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCustomViewElements()
    }
    
    func setupCustomViewElements() {
        setCustomView()
        setCustomLabels()
    }
    
    func setCustomView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .cyan
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.cornerRadius = 50
    }
    
    func setCustomLabels() {
        self.addSubview(customLabel)
        self.addSubview(anotherCustomLabel)
        
        customLabel.isUserInteractionEnabled = true
        customLabel.layer.borderColor = UIColor.black.cgColor
        customLabel.layer.borderWidth = 1.0
        customLabel.textAlignment = .center
        
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        customLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        customLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
        customLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0).isActive = true
        
        anotherCustomLabel.isUserInteractionEnabled = true
        anotherCustomLabel.layer.borderColor = UIColor.black.cgColor
        anotherCustomLabel.layer.borderWidth = 1.0
        anotherCustomLabel.textAlignment = .center
        
        anotherCustomLabel.translatesAutoresizingMaskIntoConstraints = false
        anotherCustomLabel.anchorCenterYToSuperview()
        anotherCustomLabel.anchor(nil,
                                  left: self.safeAreaLayoutGuide.leftAnchor,
                                  bottom: nil,
                                  right: self.safeAreaLayoutGuide.rightAnchor,
                                  topConstant: 0.0,
                                  leftConstant: 20.0,
                                  bottomConstant: 0,
                                  rightConstant: 20.0,
                                  widthConstant: 0.0,
                                  heightConstant: 0.0)
    }
    
    func setData(dataForControl: CustomControlData, animated: Bool? = true) {
        let labelsBackgroundColor = dataForControl.color.cgColor
        
        customLabel.layer.backgroundColor = labelsBackgroundColor
        anotherCustomLabel.layer.backgroundColor = labelsBackgroundColor
        
        customLabel.alpha = 1.0
        anotherCustomLabel.alpha = 0.0
        if animated! {
            UIView.animate(withDuration: 3.0,
                           delay: 0.0,
                           options: [.repeat, .autoreverse, .allowUserInteraction],
                           animations: {
                            self.backgroundColor = .blue
                            self.backgroundColor = .cyan
            }, completion: nil)
            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           options: [.repeat, .autoreverse, .allowUserInteraction],
                           animations: {
                            self.customLabel.alpha = 0.0
                            self.customLabel.text = dataForControl.text[0...2].randomElement()

                            self.anotherCustomLabel.alpha = 1.0
                            self.anotherCustomLabel.text = dataForControl.text[3...4].randomElement()
            }, completion: nil)
        } else {
            customLabel.text = dataForControl.text.randomElement()
        }
        
    }
}
