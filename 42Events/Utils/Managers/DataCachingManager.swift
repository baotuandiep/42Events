//
//  DataCachingManager.swift
//  42Events
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

class DataCachingManager {

    var fileName: String
    private let fileExtension = "json"

    init(fileName: String) {
        self.fileName = fileName
    }

    func saveCachingData<T: Encodable>(model: T) {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(fileName)
            fileURL = fileURL.appendingPathExtension(fileExtension)
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(model)
                try data.write(to: fileURL, options: [.atomicWrite])
            } catch {
                print(error)
            }
        }
    }

    func loadCachingData<T: Decodable>(type: T.Type) -> T? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(fileName)
            fileURL = fileURL.appendingPathExtension(fileExtension)
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(T.self, from: data)
                return result
            } catch {
                print(error)
            }
        }
        return nil
    }

    func deleteLocal() {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            let url = URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(fileName).appendingPathExtension(fileExtension)
            try? FileManager.default.removeItem(at: url)
        }
    }
}

