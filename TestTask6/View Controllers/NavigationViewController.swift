//
//  NavigationViewController.swift
//  TestTask6
//
//  Created by Marcos Vicente on 02.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController {

    //    method to call the view controller through is ID
    @IBAction func idTransitionButtonOnTouchUpInside(_ sender: Any) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationViewController = mainStoryboard.instantiateViewController(withIdentifier: "DestinationViewController") as? DestinationViewController else {
            print("Couldn't find View Controller")
            return
        }
        
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
//    method to call and create the view controller, programmatically
    @IBAction func codedTransitionToCodedViewControllerButtonOnTouchUpInside(_ sender: Any) {
        let nextScreen = CustomViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}
