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
}

extension HomeInteractor: HomePresenterToInteractorProtocol {
    
}

extension HomeInteractor {
    func loadData() {
        APIManager.shared.loadData(type: HomeModel.self, path: "race-events", queryParams: [:]) {
            switch $0 {
            case .success(let model):
                print(model)
            case .error(let error):
                print(error)
            }
        }
    }
}
