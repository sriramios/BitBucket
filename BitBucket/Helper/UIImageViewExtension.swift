//
//  UIImageViewExtension.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImageFrom(imageUrl: String, imageMode:  UIView.ContentMode = UIView.ContentMode.scaleAspectFit) {
        guard let url = URL(string: imageUrl) else { return }
        weak var weakSelf = self
        image = UIImage.contactPlaceHolder()
        ImageCache.shared.downloadImageFrom(url: url) { (image) in
            if let downloadedImg = image {
                weakSelf?.image = downloadedImg
            }
        }
    }
    
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 3.0
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
}


extension UIImage {
    static func contactPlaceHolder() -> UIImage {
        return UIImage(named: "placeholder_photo")!
    }
}
