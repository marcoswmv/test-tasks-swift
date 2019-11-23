//
//  ArticleMAange.swift
//  TestTask6
//
//  Created by Marcos Vicente on 15.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import Foundation
import UIKit

class ArticleManager {
    
    let networkingClient = NetworkingManager()
    
    typealias WebServiceRequest = ([Article]?, Error?) -> Void
    
    func getArticle(completion: @escaping WebServiceRequest) {
        guard let urlToExecute = URL(string: "http://api.gazeta.ru/iphone-xml/first.json") else {
            return
        }
        
        networkingClient.executeRequest(urlToExecute) { (mainObject, error) in
            if error != nil {
                completion(nil, error)
            } else if let arrayOfArticles = mainObject {
                if let eachArticle = arrayOfArticles["article"] as? [[String: Any]] {
                    var result = [Article]()
//                        PARSE JSON to expected object format
                    for objectToPass in eachArticle {
                        result.append(Article(articles: objectToPass))
                    }
                    completion(result, nil)
                }
            }
        }
    }
}
