//
//  DestinationViewController.swift
//  TestTask6
//
//  Created by Marcos Vicente on 02.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setupCustomBackButton() {
        let customBackButton = UIButton()
        self.view.addSubview(customBackButton)

        customBackButton.backgroundColor = .white
        customBackButton.setTitleColor(.red, for: .normal)
        customBackButton.setTitle(NSLocalizedString("Back", comment: "Back button from coded view"), for: .normal)

        customBackButton.translatesAutoresizingMaskIntoConstraints = false
        customBackButton.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        customBackButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        customBackButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        customBackButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        customBackButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
    }

    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
