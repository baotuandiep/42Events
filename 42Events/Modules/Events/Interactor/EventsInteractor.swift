//
//  EventsInteractor.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

class EventsInteractor {
    weak var presenter: EventsInteractorToPresenterProtocol?

    let path = "race-filters"
    var dataCachingManager: DataCachingManager

    private var expirationTime: Double = 3600 // 1 hour

    init() {
        dataCachingManager = DataCachingManager(fileName: path)
    }
}

extension EventsInteractor: EventsPresenterToInteractorProtocol {
    func loadData(eventType: EventsType) {
        let savedTimestamp = UserDefaults.standard.double(forKey: path + eventType.rawValue)
        if Date().timeIntervalSince1970 - savedTimestamp < expirationTime,
            let model = dataCachingManager.loadCachingData(type: EventsModel.self) {
            presenter?.receiveData(datas: model.data)
        } else {
            loadDataFromAPI(eventType: eventType)
        }
    }
}

extension EventsInteractor {
    func loadDataFromAPI(eventType: EventsType) {
        let queryParams: [String: Any] = [
            "skipCount": 0,
            "limit": 10,
            "sportType": eventType.rawValue
        ]
        APIManager.shared.loadData(type: EventsModel.self, path: path, queryParams: queryParams) { [weak self] in
            guard let self = self else { return }
            switch $0 {
            case .success(let model):
                self.presenter?.receiveData(datas: model.data)
                DispatchQueue.global(qos: .background).async { [weak self] in
                    self?.dataCachingManager.saveCachingData(model: model)
                }
                UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: self.path + eventType.rawValue)
            case .error(let error):
                print(error)
            }
        }
    }
}
