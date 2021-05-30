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
    var pathUserDefaultString: String {
        path + eventType.rawValue
    }
    var dataCachingManager: DataCachingManager
    var eventType: EventsType
    var apiManager = APIManager.shared

    private var expirationTime: Double = 3600 // 1 hour

    init(eventType: EventsType) {
        self.eventType = eventType
        dataCachingManager = DataCachingManager(fileName: path + eventType.rawValue)
    }
}

extension EventsInteractor: EventsPresenterToInteractorProtocol {
    func loadData() {
        let savedTimestamp = UserDefaults.standard.double(forKey: pathUserDefaultString)
        if Date().timeIntervalSince1970 - savedTimestamp < expirationTime,
            let model = dataCachingManager.loadCachingData(type: EventsModel.self) {
            presenter?.receiveData(datas: model.data)
        } else {
            loadDataFromAPI()
        }
    }
}

extension EventsInteractor {
    func loadDataFromAPI() {
        let queryParams: [String: Any] = [
            "skipCount": 0,
            "limit": 10,
            "sportType": eventType.rawValue
        ]
        apiManager.loadData(type: EventsModel.self, path: path, queryParams: queryParams) { [weak self] in
            guard let self = self else { return }
            switch $0 {
            case .success(let model):
                self.presenter?.receiveData(datas: model.data)
                DispatchQueue.global(qos: .background).async { [weak self] in
                    self?.dataCachingManager.saveCachingData(model: model)
                }
                UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: self.pathUserDefaultString)
            case .error(let error):
                self.presenter?.receiveError(error: error)
            }
        }
    }
}
