//
//  HomeViewInteractor.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation
import SRNetworking

class HomeViewInteractor: HomeViewPresenterToInteractor {
    weak var presenter: HomeViewInteractorToPresenter?
    var webService: APIService?
    
    init(_ presenter: HomeViewInteractorToPresenter) {
        self.presenter = presenter
    }
    
    func fetchRepos(nextSet: String?) {
        webService = APIService.init()
        weak var weakSelf = self
        
        if let nextLinkStr = nextSet , let nextSetUrl = URL(string: nextLinkStr) {
            webService?.load(url: nextSetUrl) { (result: Result<RepoSetResponse>) in
                switch result {
                case .success(let response) :
                    weakSelf?.presenter?.didFetched(repos: response.values, nextLink: response.next)
                case .failure(let error):
                    weakSelf?.presenter?.didFailed()
                }
            }
        } else {
            webService?.load(endpoint: BitBucketRequest.publicRepo) { (result: Result<RepoSetResponse>) in
                switch result {
                case .success(let response) :
                    weakSelf?.presenter?.didFetched(repos: response.values, nextLink: response.next)
                case .failure:
                    weakSelf?.presenter?.didFailed()
                }
            }
        }
        
    }
    
}
