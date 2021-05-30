//
//  HomeInteractor.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

class HomeInteractor {
    weak var presenter: HomeInteractorToPresenterProtocol?
    let path = "race-events"
    var dataCachingManager: DataCachingManager

    private var expirationTime: Double = 3600 // 1 hour

    init() {
        dataCachingManager = DataCachingManager(fileName: path)
    }
}

extension HomeInteractor: HomePresenterToInteractorProtocol {
    func loadData() {
        let savedTimestamp = UserDefaults.standard.double(forKey: path)
        if Date().timeIntervalSince1970 - savedTimestamp < expirationTime,
            let model = dataCachingManager.loadCachingData(type: HomeModel.self) {
            presenter?.receiveData(data: model.data)
        } else {
            loadDataFromAPI()
        }
    }
}

extension HomeInteractor {
    func loadDataFromAPI() {
        APIManager.shared.loadData(type: HomeModel.self, path: path, queryParams: [:]) { [weak self] in
            guard let self = self else { return }
            switch $0 {
            case .success(let model):
                self.presenter?.receiveData(data: model.data)
                DispatchQueue.global(qos: .background).async { [weak self] in
                    self?.dataCachingManager.saveCachingData(model: model)
                }
                UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: self.path)
            case .error(let error):
                print(error)
            }
        }
    }
}
