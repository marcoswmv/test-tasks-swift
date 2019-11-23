//
//  DataSource.swift
//  TestTask6
//
//  Created by Marcos Vicente on 02.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class DataSource: NSObject, UITableViewDataSource {
    
    var data = [Article]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleCell

        let eachArticleDictionary = data[indexPath.row]
        let imageURL = eachArticleDictionary.articleImage
        cell.setTableData(articleText: eachArticleDictionary, articleImage: imageURL)
        return cell
    }
}
