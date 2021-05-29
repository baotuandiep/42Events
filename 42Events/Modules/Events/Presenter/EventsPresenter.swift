//
//  EventsPresenter.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

class EventsPresenter {
    weak var view: EventsPresenterToViewProtocol?
    var interactor: EventsPresenterToInteractorProtocol?
    var router: EventsPresenterToRouterProtocol?
}

extension EventsPresenter: EventsViewToPresenterProtocol {

}

extension EventsPresenter: EventsInteractorToPresenterProtocol {

}
