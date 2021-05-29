//
//  EventsInteractor.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

class EventsInteractor {
    weak var presenter: EventsInteractorToPresenterProtocol?
}

extension EventsInteractor: EventsPresenterToInteractorProtocol {

}

extension EventsInteractor {
}
