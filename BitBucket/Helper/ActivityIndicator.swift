//
//  ActivityIndicator.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation
import UIKit


final class CustomActivityIndicatorView {
    internal static var indicator: UIActivityIndicatorView?
    
    static func show() {
        if indicator == nil, let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            let frame = UIScreen.main.bounds
            indicator = UIActivityIndicatorView(frame: frame)
            indicator?.backgroundColor = UIColor.white.withAlphaComponent(0.3)
            indicator?.style =  .large
            indicator?.color = UIColor.darkGray
            window.addSubview(indicator!)
            indicator!.startAnimating()
        }
    }
    
    static func stop() {
        if  indicator != nil {
            indicator!.stopAnimating()
            indicator!.removeFromSuperview()
            indicator = nil
        }
    }
    
    static func update() {
        if indicator != nil {
            stop()
            show()
        }
    }
}
