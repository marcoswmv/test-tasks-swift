//
//  Articles.swift
//  TestTask6
//
//  Created by Marcos Vicente on 09.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit

class Article {
    var articleTitle: String
    var articleImage: URL
    
    init(articles: [String: Any]) {
        self.articleTitle = articles["article_subheader"] as! String
        self.articleImage = URL(string: articles["pic148"] as! String)!
    }
    
}
