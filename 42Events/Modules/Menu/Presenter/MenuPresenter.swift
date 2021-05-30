//
//  MenuPresenter.swift
//  42Events
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class MenuPresenter {
    weak var view: MenuPresenterToViewProtocol?
    var interactor: MenuPresenterToInteractorProtocol?
    var router: MenuPresenterToRouterProtocol?
}

extension MenuPresenter: MenuViewToPresenterProtocol {
    func getLanguageList() {
        interactor?.getLanguageList()
    }

    func selectLanguage(index: Int) {
        interactor?.selectLanguage(index: index)
    }
}

extension MenuPresenter: MenuInteractorToPresenterProtocol {
    func languagueList(languages: [String], selectedIndex: Int) {
        view?.languageList(languages: languages, selectedIndex: selectedIndex)
    }
}

extension MenuPresenter {
    func showView(superview: UIView) {
        view?.showView(superview: superview)
    }

    func closeView() {
        view?.closeView()
    }
}
