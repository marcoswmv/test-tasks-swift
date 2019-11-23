//
//  ItemViewController.swift
//  TestTask6
//
//  Created by Marcos Vicente on 19.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
class ItemViewController: UIViewController {

    @IBOutlet weak var redView: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture(view: redView)
    }
    
    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self as Any, action: #selector(handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let theView = sender.view!
        let translation = sender.translation(in: self.view)
        
        switch sender.state {
        case .began:
            print("BEGAN TOUCHING THE VIEW!")
        case .changed:
            print("KEEP TOUCHING THE VIEW!")
            theView.center = CGPoint(x: theView.center.x + translation.x, y: theView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            print("ENDED TOUCHING THE VIEW!")
        default:
            break
        }
        
    }

}
