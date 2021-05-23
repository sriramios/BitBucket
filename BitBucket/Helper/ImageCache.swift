//
//  ImageCache.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation
import UIKit
import SRNetworking

class ImageCache: NSObject {
    let imageCache = NSCache<NSString, AnyObject>()
    
    static let shared = ImageCache()

    func downloadImageFrom(url: URL, completionHandler:@escaping ((UIImage?) -> Void)) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            completionHandler(cachedImage)
        } else {
            let webService = APIService.init()
            webService.downloadImage(url: url) { (result: Result<UIImage>) in
                
                switch result {
                case .success(let image) :
                    self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completionHandler(image)
                case .failure:
                    completionHandler(nil)
                }
                
            }
        }
    }
}
