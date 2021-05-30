//
//  APIManager.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

enum ErrorType {
    case requestError(String)
    case dataError
    case clientError
    case serverError
    case noData
    case unknow

    var value: String {
        switch self {
        case .dataError:
            return "Data Error"
        case .clientError:
            return "Data Format Error"
        case .serverError:
            return "Somethings wrong with our server"
        case .noData:
            return "Sorry! There is no result!"
        case .unknow:
            return "Unknow error"
        case .requestError(let string):
            return string
        }
    }
}

enum APIResult<T> {
    case success(T)
    case error(ErrorType)
}

class APIManager: NSObject {
    static let shared = APIManager()

    private let host = "api-v2-sg-staging.42race.com"
    private let mainPath = "/api/v1"
    private let scheme = "https"

    private let urlSession = URLSession.shared

    func loadData<T: Decodable>(type: T.Type, path: String, queryParams: [String: Any], completion: @escaping ((APIResult<T>) -> Void)) {
        let path = mainPath + "/" + path
        guard let url = url(path: path, queryParams: queryParams) else {
            return completion(.error(.clientError))
        }
        handleRequest(type: type, url: url, completion: completion)
    }

    private func handleRequest<T: Decodable>(type: T.Type, url: URL, completion: @escaping ((APIResult<T>) -> Void)) {
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            if let error = error {
                return completion(.error(.requestError(error.localizedDescription)))
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                return completion(.error(.unknow))
            }
            switch httpResponse.statusCode {
            case 200...299:
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let data = data {
                    do {
                        let result = try decoder.decode(T.self, from: data)
                        completion(.success(result))
                    } catch {
                        completion(.error(.dataError))
                    }
                } else {
                    completion(.error(.noData))
                }
            case 404:
                completion(.error(.noData))
            case 400...499:
                completion(.error(.clientError))
            case 500...599:
                completion(.error(.serverError))
            default:
                completion(.error(.unknow))
            }
        }
        task.resume()
    }

    private func url(path: String, queryParams: [String: Any]) -> URL? {
        var urlComponent = URLComponents()
        urlComponent.host = host
        urlComponent.scheme = scheme
        urlComponent.path = path
        urlComponent.queryItems = queryParams.map {
            URLQueryItem(name: $0.key, value: "\($0.value)")
        }
        return urlComponent.url
    }
}
