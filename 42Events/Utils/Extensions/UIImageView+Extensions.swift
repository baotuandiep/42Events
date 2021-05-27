//
//  UIImageView+Extensions.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImage(url: URL, placeholder: UIImage? = nil, onComplete: ((UIImage?) -> Void)? = nil) {
        if let placeholder = placeholder {
            image = placeholder
        }
        ImageCachingManager.shared.loadImage(url: url) { [weak self] image in
            let imageResult = image ?? placeholder
            if Thread.isMainThread {
                self?.image = imageResult
                onComplete?(image)
            } else {
                DispatchQueue.main.async {
                    self?.image = image
                    onComplete?(image)
                }
            }
        }
    }
}
