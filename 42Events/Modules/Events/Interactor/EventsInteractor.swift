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
}

extension EventsInteractor: EventsPresenterToInteractorProtocol {
    func loadData(eventType: EventsType) {
//        EventsModel
//        https://api-v2-sg-staging.42race.com/api/v1/race-filters?skipCount=0&limit=10&sportType=running
        let queryParams: [String: Any] = [
            "skipCount": 0,
            "limit": 10,
            "sportType": eventType.rawValue
        ]
        APIManager.shared.loadData(type: EventsModel.self, path: "race-filters", queryParams: queryParams) { [weak self] in
            switch $0 {
            case .success(let model):
                self?.presenter?.receiveData(datas: model.data)
            case .error(let error):
                print(error)
            }
        }
    }
}

extension EventsInteractor {
}
