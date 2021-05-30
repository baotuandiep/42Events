//
//  EventsProtocols.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

protocol EventsViewToPresenterProtocol: class {
    var view: EventsPresenterToViewProtocol? { get set }
    var interactor: EventsPresenterToInteractorProtocol? { get set }
    var router: EventsPresenterToRouterProtocol? { get set }
    func loadData()
    func isShowMedalChangedValue(isShowMedal: Bool, tableView: UITableView)
    func showMenu(view: UIView)
}

protocol EventsPresenterToViewProtocol: class {
    func receiveData(datas: [EventModel])
}

protocol EventsPresenterToRouterProtocol: class {
    func showMenu(view: UIView)
}

protocol EventsPresenterToInteractorProtocol: class {
    var presenter: EventsInteractorToPresenterProtocol? { get set }
    func loadData()
}

protocol EventsInteractorToPresenterProtocol: class {
    func receiveData(datas: [EventModel])
}
