//
//  Repo.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation

struct Repo: Codable {
    let name: String?
    let website: String?
    let language: String?
    let createdOn: String?
    let project: Project?
    let owner: Owner?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case createdOn = "created_on"
        case website = "website"
        case language = "language"
        case project = "project"
        case owner = "owner"
    }
}

struct Project: Codable {
    let name: String?
    let type: String?
    let links: Links?
}

struct Owner: Codable {
    let name: String?
    let type: String?
    let links: Links?
}

struct Links: Codable {
    let avatar: Link?
    
    enum CodingKeys: String, CodingKey {
        case avatar = "avatar"
    }
}

struct Link: Codable {
    let href: String?
}
