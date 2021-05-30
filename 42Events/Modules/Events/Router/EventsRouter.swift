//
//  EventsRouter.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class EventsRouter: EventsPresenterToRouterProtocol {
    static func createModule(eventType: EventsType) -> EventsViewController {
        let viewController = EventsViewController()
        let presenter = EventsPresenter(eventType: eventType)
        let interactor = EventsInteractor(eventType: eventType)
        let router = EventsRouter()

        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return viewController
    }

    func showMenu(view: UIView) {
        MenuRouter.createModule(on: view)
    }
}
