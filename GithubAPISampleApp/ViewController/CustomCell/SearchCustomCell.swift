//
//  SearchCustomCell.swift
//  GithubAPISampleApp
//
//  Created by Shota Nishizawa on 2019/08/22.
//  Copyright © 2019 Shota Nishizawa. All rights reserved.
//

import UIKit

class SearchCustomCell: UITableViewCell {
    
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var urlButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    ///画像の角丸
    private func setupLayout() {
        self.userImageView.contentMode = .scaleAspectFill
        self.userImageView.layer.cornerRadius = 20
        self.userImageView.clipsToBounds = true
    }
    
}
