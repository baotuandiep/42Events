//
//  HomeInteractor.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

class HomeInteractor {
    var presenter: HomeInteractorToPresenterProtocol?
}

extension HomeInteractor: HomePresenterToInteractorProtocol {

}
