//
//  HomeViewRouter.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation
import UIKit

class HomeViewRouter: HomeViewPresenterToRouter {
    
    static func createModule() -> HomeViewController {
        let viewController = HomeViewController.instantiate()
        let presenter = HomeViewPresenter(HomeViewRouter())
        viewController.presenter = presenter
        let interactor = HomeViewInteractor(presenter)
        presenter.interactor = interactor
        presenter.view = viewController
        return viewController
    }
  
    func showWebScreen(repo: Repo, navigationController: UINavigationController)  {
        let webVc = WebViewController.instantiate()
        webVc.link = URL(string: repo.website ?? "")
        navigationController.pushViewController(webVc, animated: true)
    }
    
    
}
