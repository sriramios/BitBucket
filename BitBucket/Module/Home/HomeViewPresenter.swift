//
//  HomeViewPresenter.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation
import UIKit

class HomeViewPresenter: HomeViewToPresenter {
    weak var view: HomeViewPresenterToView?
    var interactor: HomeViewPresenterToInteractor?
    var router: HomeViewPresenterToRouter?
    var nextLink: String?
    var repos: [Repo] = []

    init(_ router: HomeViewRouter) {
        self.router = router
    }
    
    func fetchData() {
        CustomActivityIndicatorView.show()
        interactor?.fetchRepos(nextSet: nextLink)
    }
    
    func didSelect(indexPath: IndexPath, navigation: UINavigationController) {
        router?.showWebScreen(repo: repos[indexPath.row], navigationController: navigation)
    }
}

extension HomeViewPresenter: HomeViewInteractorToPresenter {
    func didFetched(repos: [Repo], nextLink: String?) {
        self.nextLink = nextLink
        self.repos.append(contentsOf: repos)
        let viewModels = repos.map { (repo) -> RepoViewModel in
           return RepoViewModel(repo)
        }
        CustomActivityIndicatorView.stop()
        view?.display(repos: viewModels, enableNextButton: self.nextLink != nil)
    }
    
    func didFailed() {
        CustomActivityIndicatorView.stop()
    }
}

