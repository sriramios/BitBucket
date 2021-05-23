//
//  HomeViewController.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    var presenter: HomeViewToPresenter?
    @IBOutlet var tableView: UITableView!
    var reposModels: [RepoViewModel] = []
    @IBOutlet var nextButton: UIButton!
    
    static func instantiate() -> HomeViewController {
        return AppStoryboard.main.instantiate(viewControllerClass: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isHidden = false
        presenter?.fetchData()
        tableView?.tableFooterView = UIView(frame: .zero)
    }
    @IBAction func nextButtonAction(_ sender: Any) {
        presenter?.fetchData()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if reposModels[indexPath.row].websiteIsAvaiable == true {
            presenter?.didSelect(indexPath: indexPath, navigation: self.navigationController!)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(HomeViewTableViewCell.self)", for: indexPath) as? HomeViewTableViewCell {
            cell.updateView(reposModels[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reposModels.count
    }
}

extension HomeViewController: HomeViewPresenterToView {    
    func display(repos: [RepoViewModel], enableNextButton: Bool) {
        nextButton.isHidden = !enableNextButton
        reposModels.append(contentsOf: repos) 
        tableView.reloadData()
    }
}
