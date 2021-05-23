//
//  BitBucketTests.swift
//  BitBucketTests
//
//  Created by srajend1 on 23/05/21.
//

import XCTest
@testable import BitBucket

class BitBucketTests: XCTestCase {
    
    override class func setUp() {
      
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testViewModel() {
        let project = Project(name: "test proj", type: "git", links: nil)
        let owner = Owner(name: "Sri", type: "repo", links: Links(avatar: Link(href: "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/557057:d85e506e-8256-43a7-8d24-a5e6ba4ff59a/7ca60248-37e1-44b9-b045-776407905958/128")))
        
        let model = Repo(name: "test", website: "http://www.google.com", language: "java", createdOn: "2011-09-03T12:33:16.028393+00:00", project: project, owner: owner)

        let viewModel = RepoViewModel(model)
        assert(viewModel.createdOnDate.count > 0)
        assert(viewModel.websiteIsAvaiable == true)
    }

}
