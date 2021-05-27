//
//  ImageCachingManager.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class ImageCachingManager {
    static let shared = ImageCachingManager()

    private let cache = NSCache<NSString, UIImage>()
    private let queue = DispatchQueue(label: "com.tuandiep.cachingimage", qos: .userInteractive, attributes: .concurrent)

    private init() {
        cache.name = "ImageCachingManager"
    }

    func loadImage(url: URL, onComplete: ((UIImage?) -> Void)?) {
        if let imageView = cache.object(forKey: url.absoluteString as NSString) {
            onComplete?(imageView)
        } else {
            queue.async { [weak self] in
                if let data = try? Data(contentsOf: url),
                    let image = UIImage(data: data) {
                    self?.cache.setObject(image, forKey: url.absoluteString as NSString)
                    onComplete?(image)
                } else {
                    onComplete?(nil)
                }
            }
        }
    }
}
