//
//  FirstTabBarViewController.swift
//  TestTask6
//
//  Created by Marcos Vicente on 02.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit

class FirstTabBarViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    let defaultValues = UserDefaults.standard
    
    struct Keys {
        static let savedString = "savedString"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForSavedData()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let delay = 5
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            DispatchQueue.once {
                print("Behold! the \(#function) appears in ViewController!")
//                To avoid displayTime to be called in another views
                self.generateTimer(inTarget: self)
            }
        }
    }
    
    func generateTimer(inTarget viewController: FirstTabBarViewController) {
        var timer = Timer()
        timer = Timer.scheduledTimer(timeInterval: 1, target: viewController as Any, selector: #selector(viewController.displayTime), userInfo: nil, repeats: true)
        _ = timer
    }

    @IBAction func displayButtonOnTouchUpInside(_ sender: Any) {
        defaultValues.set(inputTextField.text!, forKey: Keys.savedString)
        outputLabel.text = inputTextField.text
    }
    
    @objc func displayTime() {
        currentTimeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .long)
    }
    
    func checkForSavedData() {
        let savedData = defaultValues.value(forKey: Keys.savedString) as? String
        outputLabel.text = savedData
    }
    
    @IBAction func sliderOnValueChanged(_ sender: Any) {
        progressBar.progress = (sender as AnyObject).value
    }
    
    @IBAction func switchOnValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            activityIndicator.startAnimating()
            activityIndicator.color = .blue
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.color = .gray
        }
    }
    
}
