//
//  MenuProtocols.swift
//  42Events
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

protocol MenuViewToPresenterProtocol: class {
    var view: MenuPresenterToViewProtocol? { get set }
    var interactor: MenuPresenterToInteractorProtocol? { get set }
    var router: MenuPresenterToRouterProtocol? { get set }
    func getLanguageList()
    func selectLanguage(index: Int)
}

protocol MenuPresenterToViewProtocol: class {
    func showView(superview: UIView)
    func closeView()
    func languageList(languages: [String], selectedIndex: Int)
}

protocol MenuPresenterToRouterProtocol: class {

}

protocol MenuPresenterToInteractorProtocol: class {
    var presenter: MenuInteractorToPresenterProtocol? { get set }
    func getLanguageList()
    func selectLanguage(index: Int)
}

protocol MenuInteractorToPresenterProtocol: class {
    func languagueList(languages: [String], selectedIndex: Int)
}
