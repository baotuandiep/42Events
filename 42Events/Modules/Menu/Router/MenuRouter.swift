//
//  MenuRouter.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class MenuRouter: MenuPresenterToRouterProtocol {
    static func createModule(on view: UIView) -> MenuView {
//        let window = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive})
//        .map({$0 as? UIWindowScene})
//        .compactMap({$0})
//        .first?.windows
//        .filter({$0.isKeyWindow}).first
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

            presenter.showView(superview: view)
            return menuView
        }
    }
}
