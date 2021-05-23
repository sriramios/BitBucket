//
//  RepoSetResponse.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation

struct RepoSetResponse: Codable {
    var values: [Repo]
    var next: String
}
