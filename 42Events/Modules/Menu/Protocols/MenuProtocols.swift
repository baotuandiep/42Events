//
//  MenuProtocols.swift
//  42Events
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

protocol MenuViewToPresenterProtocol: class {
    var view: MenuPresenterToViewProtocol? { get set }
    var interactor: MenuPresenterToInteractorProtocol? { get set }
    var router: MenuPresenterToRouterProtocol? { get set }
}

protocol MenuPresenterToViewProtocol: class {

}

protocol MenuPresenterToRouterProtocol: class {

}

protocol MenuPresenterToInteractorProtocol: class {
    var presenter: MenuInteractorToPresenterProtocol? { get set }
}

protocol MenuInteractorToPresenterProtocol: class {

}
