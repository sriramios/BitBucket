//
//  RepoViewModel.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation

struct RepoViewModel {
    let name: String
    let createdOnDate: String
    let language: String
    let avatar: String
    let websiteIsAvaiable: Bool
    
    init(_ repo: Repo) {
        self.name = repo.name ?? ""
        self.createdOnDate = Date.getFormattedDate(string: repo.createdOn)
        self.avatar = repo.owner?.links?.avatar?.href ?? ""
        self.language = repo.language ?? ""
        print(repo.website ?? "no website")
        self.websiteIsAvaiable = (repo.website?.count ?? 0 > 0 )
    }
    
    
}
