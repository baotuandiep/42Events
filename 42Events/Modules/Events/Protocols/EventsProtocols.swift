//
//  EventsProtocols.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

protocol EventsViewToPresenterProtocol: class {
    var view: EventsPresenterToViewProtocol? { get set }
    var interactor: EventsPresenterToInteractorProtocol? { get set }
    var router: EventsPresenterToRouterProtocol? { get set }
}

protocol EventsPresenterToViewProtocol: class {
    
}

protocol EventsPresenterToRouterProtocol: class {

}

protocol EventsPresenterToInteractorProtocol: class {
    var presenter: EventsInteractorToPresenterProtocol? { get set }
}

protocol EventsInteractorToPresenterProtocol: class {

}
