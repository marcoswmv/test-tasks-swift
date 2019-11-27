//
//  TextTableViewController.swift
//  TestTask6
//
//  Created by Marcos Vicente on 02.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit

class ArticlesTableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    let customDataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        tableView.delegate = self
        tableView.dataSource = customDataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshData()
    }
    
    @objc func refreshData() {
        let articleManager = ArticleManager()
        articleManager.getArticle { (arrayOfArticles, error) in
            if let errorToCatch = error {
                UIViewController.Alert.showNetworkingErrorAlert(on: UIApplication.getTopViewController()!, message: errorToCatch.localizedDescription)
            } else if let arrayToPass = arrayOfArticles {
                self.customDataSource.data = arrayToPass
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
            
        }
    }
}
