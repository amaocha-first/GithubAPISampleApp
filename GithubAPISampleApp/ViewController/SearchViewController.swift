//
//  ViewController.swift
//  GithubAPISampleApp
//
//  Created by Shota Nishizawa on 2019/08/22.
//  Copyright © 2019 Shota Nishizawa. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
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
            cell.repositoryNameLabel.text = "なんとかリポジトリ"
            cell.languageLabel.text = "Java"
            cell.userImageView.image = UIImage(named: "image")
            cell.urlButton.setTitle("https://qiita.com/Iorin0225/items/48cdcdd7ab38a5cb8afa", for: .normal)
        }
        return cell
    }
    
    ///tableViewの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

