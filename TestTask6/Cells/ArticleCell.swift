//
//  ThirdTabBarViewController.swift
//  TestTask6
//
//  Created by Marcos Vicente on 02.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var labelFromCell: UILabel!
    @IBOutlet weak var articleImageFromCell: UIImageView!
    
    func setTableData(articleText: Article, articleImage: URL) {
        let imagePlaceholder = UIImage(named: "cc.jpg")
        
        labelFromCell.text = articleText.articleTitle
        articleImageFromCell.kf.setImage(with: articleImage,
                                         placeholder: imagePlaceholder,
                                         options: nil,
                                         progressBlock: nil) { (result) in
                                            switch result {
                                            case .success(let value):
                                                // From where the image was retrieved:
                                                // - .none - Just downloaded.
                                                // - .memory - Got from memory cache.
                                                // - .disk - Got from disk cache.
                                                print(value.cacheType)
                                            case .failure(let error):
                                                print(error.localizedDescription)
                                            }
        }
    }
}
