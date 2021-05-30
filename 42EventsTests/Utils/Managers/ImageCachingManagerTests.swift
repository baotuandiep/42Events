//
//  ImageCachingManagerTests.swift
//  42EventsTests
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import XCTest
@testable import _2Events

class ImageCachingManagerTests: XCTestCase {
    var imageCachingManager: ImageCachingManager!
    let imageName = "category-bike"
    let image = UIImage(named: "category-bike")!

    override func setUp() {
        imageCachingManager = ImageCachingManager.shared
    }

    override func tearDown() {
        imageCachingManager.clearAllCache()
        imageCachingManager = nil
        deleteFile(fileName: imageName)
    }

    func testLoadImageWithNonCache() {
        let url = saveImageToDatabaseDisk(image: image, imageName: imageName)!

        var imageLoaded: UIImage!
        let promise = expectation(description: "testLoadImageWithNonCache")
        imageCachingManager.clearAllCache()
        imageCachingManager.loadImage(url: url) {
            imageLoaded = $0
            promise.fulfill()
        }
        // The image is not load immediately
        // and it takes time to load from url
        XCTAssertNil(imageLoaded)
        wait(for: [promise], timeout: 5)
        XCTAssertNotNil(imageLoaded)
    }

    func testLoadImageWithCache() {
        let url = saveImageToDatabaseDisk(image: image, imageName: imageName)!

        // Trying to save image to Cache
        var imageLoaded: UIImage!
        let promise = expectation(description: "testLoadImageWithNonCache")
        imageCachingManager.clearAllCache()
        imageCachingManager.loadImage(url: url) {
            imageLoaded = $0
            promise.fulfill()
        }
        // The image is not load immediately
        // and it takes time to load from url
        XCTAssertNil(imageLoaded)
        wait(for: [promise], timeout: 5)
        XCTAssertNotNil(imageLoaded)

        // Load again and no need to wait
        imageLoaded = nil
        imageCachingManager.loadImage(url: url) {
            imageLoaded = $0
        }
        XCTAssertNotNil(imageLoaded)
    }

    func saveImageToDatabaseDisk(image: UIImage, imageName: String) -> URL? {
        guard let data = image.pngData() else {
            return nil
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return nil
        }
        do {
            let url = directory.appendingPathComponent(imageName)!
            try data.write(to: url)
            return url
        } catch {
            return nil
        }
    }

    func deleteFile(fileName: String) {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            let url = URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(fileName)
            try? FileManager.default.removeItem(at: url)
        }
    }
}
