//
//  WebViewController.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    var link: URL?
    
    static func instantiate() -> WebViewController {
        return AppStoryboard.main.instantiate(viewControllerClass: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = link {
            webView.load(URLRequest(url: url))
        }
    }
    
    deinit {
        webView = nil
    }

}

