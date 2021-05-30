//
//  HomePresenter.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class HomePresenter {
    weak var view: HomePresenterToViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
}

extension HomePresenter: HomeViewToPresenterProtocol {
    func loadData() {
        interactor?.loadData()
    }

    func touchedOnEvent(navigationController: UINavigationController, eventType: EventsType) {
        router?.pushToEventScreen(navigationController: navigationController, eventType: eventType)
    }

    func showMenu(view: UIView) {
        router?.showMenu(view: view)
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    func receiveData(data: HomeDataModel) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.receiveData(data: data)
        }
    }
}
