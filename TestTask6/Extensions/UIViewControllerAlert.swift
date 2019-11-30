//
//  Alert.swift
//  TestTask6
//
//  Created by Marcos Vicente on 15.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit

extension UIViewController {
    struct Alert {
        private static func showBasicAlert(on viewController: UIViewController, with title:  String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("common.ok", comment: "Alert button - OK"),
                                          style: .default, handler: nil))
            DispatchQueue.main.async {  viewController.present(alert, animated: true, completion: nil)  }
        }
        
        static func showNetworkingErrorAlert(on viewController: UIViewController, message: String)  {
            showBasicAlert(on: viewController,
                           with: NSLocalizedString("networking.404", comment: "Networking Error Title"),
                           message: message)
        }
    }
}
