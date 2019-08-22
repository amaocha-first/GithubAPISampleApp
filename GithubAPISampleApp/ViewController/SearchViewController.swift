//
//  ViewController.swift
//  GithubAPISampleApp
//
//  Created by Shota Nishizawa on 2019/08/22.
//  Copyright © 2019 Shota Nishizawa. All rights reserved.
//

import UIKit
import APIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    var searchController = UISearchController()
    
    var items: [SearchResultEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        
        tableView.tableHeaderView = searchController.searchBar
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "SearchCustomCell", bundle: nil), forCellReuseIdentifier: "SearchCustomCell")
        self.tableView.estimatedRowHeight = 250
        self.tableView.rowHeight = 180
    }
    
    ///tableViewに表示する内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCustomCell", for: indexPath)
        if let cell = cell as? SearchCustomCell {
            cell.repositoryNameLabel.text = self.items[indexPath.row].repositoryName ?? ""
            cell.languageLabel.text = self.items[indexPath.row].languageName ?? ""
            cell.userImageView.image = UIImage(named: self.items[indexPath.row].userIconImage ?? "")
            cell.urlButton.setTitle(self.items[indexPath.row].urlBtnText ?? "", for: .normal)
        }
        return cell
    }
    
    ///tableViewの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count ?? 0
    }
    
    ///文字が入力される度に呼ばれる
    func updateSearchResults(for searchController: UISearchController) {
        let request = FetchRepositoryRequest(userName: searchController.searchBar.text ?? "")
        
        ///API通信
        Session.send(request) { result in
            
            switch result {
                
            case .success(let res):
                print("成功\(res)")
                self.items = res
                self.tableView.reloadData()
            case .failure(let err):
                
                print("しくった\(err)")
                
            }
            
        }
    }
}

