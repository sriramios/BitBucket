//
//  HomeViewProtocols.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import UIKit

protocol HomeViewToPresenter: class {
    func fetchData()
    func didSelect(indexPath: IndexPath, navigation: UINavigationController) 
}

protocol HomeViewPresenterToInteractor: class {
    func fetchRepos(nextSet: String?)
}

protocol HomeViewInteractorToPresenter: class{
    func didFetched(repos: [Repo],nextLink: String?)
    func didFailed()
}

protocol HomeViewPresenterToView: class {
    func display(repos: [RepoViewModel], enableNextButton: Bool)
}

protocol HomeViewPresenterToRouter: class {
    func showWebScreen(repo: Repo, navigationController: UINavigationController) 
}
