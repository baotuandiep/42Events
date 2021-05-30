//
//  HomeProtocols.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

protocol HomeViewToPresenterProtocol: class {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    func loadData()
    func touchedOnEvent(navigationController: UINavigationController, eventType: EventsType)
    func showMenu(view: UIView)
}

protocol HomePresenterToViewProtocol: class {
    func receiveData(data: HomeDataModel)
}

protocol HomePresenterToRouterProtocol: class {
    func pushToEventScreen(navigationController: UINavigationController, eventType: EventsType)
    func showMenu(view: UIView)
}

protocol HomePresenterToInteractorProtocol: class {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func loadData()
}

protocol HomeInteractorToPresenterProtocol: class {
    func receiveData(data: HomeDataModel)
}
