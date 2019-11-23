//
//  SecondTabBarViewController.swift
//  TestTask6
//
//  Created by Marcos Vicente on 02.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 11.0, *)
class SecondTabBarViewController: UIViewController {
    
    @IBOutlet weak var customView: CustomView!
    @IBOutlet weak var customViewCenterYConstraint: NSLayoutConstraint!
    
    var viewIsNotInThePlace = false
    var animationHasBeenShown = false
    let customDataManager = CustomDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture(view: customView)
    }
    
    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self as Any, action: #selector(handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let theView = sender.view!
        let translation = sender.translation(in: self.view)
        
        switch sender.state {
        case .began, .changed:
            theView.center = CGPoint(x: theView.center.x + translation.x, y: theView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        default:
            break
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !viewIsNotInThePlace {
            customDataManager.generatedDataToBeReturned = { generatedRandomData in
                self.customView.setData(dataForControl: generatedRandomData)
            }
            customDataManager.generateData()
            viewIsNotInThePlace = true
        } else {
            customDataManager.dataGenerator { generatedRandomData in
                self.customView.setData(dataForControl: generatedRandomData, animated: true)
            }
        }
        customViewCenterYConstraint.constant -= view.bounds.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !animationHasBeenShown {
            UIView.animate(withDuration: 1.5,
                           delay: 0.0,
                           options: .curveEaseOut,
                           animations: {
                            self.customViewCenterYConstraint.constant +=  self.view.bounds.height
                            self.view.layoutIfNeeded()
            },
                           completion: nil)
            animationHasBeenShown = true
        } else {
            customViewCenterYConstraint.constant +=  self.view.bounds.height
        }
    }
}
