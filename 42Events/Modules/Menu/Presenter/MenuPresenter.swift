//
//  MenuPresenter.swift
//  42Events
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

class MenuPresenter {
    weak var view: MenuPresenterToViewProtocol?
    var interactor: MenuPresenterToInteractorProtocol?
    var router: MenuPresenterToRouterProtocol?
}

extension MenuPresenter: MenuViewToPresenterProtocol {

}

extension MenuPresenter: MenuInteractorToPresenterProtocol {

}
