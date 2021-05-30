//
//  MenuRouter.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class MenuRouter: MenuPresenterToRouterProtocol {
    @discardableResult
    static func createModule(on view: UIView) -> MenuView {
        if let menuView = view.subviews.first(where: { $0 is MenuView }) as? MenuView {
            (menuView.presenter as? MenuPresenter)?.closeView()
            return menuView
        } else {
            let menuView = MenuView.instantiate()

            let presenter = MenuPresenter()
            let interactor = MenuInteractor()
            let router = MenuRouter()
            menuView.presenter = presenter
            presenter.view = menuView
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            presenter.getLanguageList()

            presenter.showView(superview: view)
            return menuView
        }
    }
}
