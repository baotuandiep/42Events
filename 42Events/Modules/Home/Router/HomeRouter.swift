//
//  HomeRouter.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class HomeRouter: HomePresenterToRouterProtocol {
    static func createModule() -> UINavigationController {
        let viewController = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()

        viewController.presentor = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
