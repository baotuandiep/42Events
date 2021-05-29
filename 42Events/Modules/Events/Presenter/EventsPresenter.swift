//
//  EventsPresenter.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class EventsPresenter {
    weak var view: EventsPresenterToViewProtocol?
    var interactor: EventsPresenterToInteractorProtocol?
    var router: EventsPresenterToRouterProtocol?

    var eventType: EventsType
    init(eventType: EventsType) {
        self.eventType = eventType
    }
}

extension EventsPresenter: EventsViewToPresenterProtocol {
    func loadData() {
        (view as? UIViewController)?.title = eventType.rawValue.capitalized
        interactor?.loadData(eventType: eventType)
    }
}

extension EventsPresenter: EventsInteractorToPresenterProtocol {
    func receiveData(datas: [EventModel]) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.receiveData(datas: datas)
        }
    }
}
