//
//  HomeViewTableViewCell.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation
import UIKit

class HomeViewTableViewCell: UITableViewCell {
    @IBOutlet var nameValueLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var repoImageView: UIImageView!
    @IBOutlet var websiteValueLabel: UILabel!
    
    func updateView(_ viewModel: RepoViewModel) {
        nameValueLabel.text = viewModel.name
        languageLabel.text = viewModel.language
        dateLabel.text = viewModel.createdOnDate
        repoImageView.downloadImageFrom(imageUrl: viewModel.avatar)
        websiteValueLabel.text = (viewModel.websiteIsAvaiable) ? "True" : "False"
    }
    
}
