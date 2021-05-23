//
//  PublicRepoRequest.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation
import SRNetworking

enum BitBucketRequest: Endpoint {
    case publicRepo

    var Config: NetworkConfiguration {
        return NetworkConfiguration(base: "api.bitbucket.org")
    }
    
    var queryParams: QueryParams? {
        return nil
    }
    
    var path: String? {
        switch self {
        case .publicRepo:
            return "/2.0/repositories"
        }
    }
    
}
