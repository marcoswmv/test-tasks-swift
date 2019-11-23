//
//  ImagePreviewViewController.swift
//  TestTask6
//
//  Created by Marcos Vicente on 20.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit

class ImagePreviewViewController: UIViewController {
    
    var capturedImage: UIImage?
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let takenPhoto = capturedImage {
            imageView.image = takenPhoto
        }
        navigationItem.backBarButtonItem?.action = #selector(goBack)
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
