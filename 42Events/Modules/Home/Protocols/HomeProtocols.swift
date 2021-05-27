//
//  HomeProtocols.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

protocol HomeViewToPresenterProtocol: class {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    func loadData()
}

protocol HomePresenterToViewProtocol: class {

}

protocol HomePresenterToRouterProtocol: class {

}

protocol HomePresenterToInteractorProtocol: class {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func loadData()
}

protocol HomeInteractorToPresenterProtocol: class {

}
