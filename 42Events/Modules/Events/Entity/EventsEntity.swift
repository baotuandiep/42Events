//
//  EventsEntity.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

enum EventsType: String, CaseIterable {
    case running, cycling, walking
}

struct EventsModel: Decodable, Encodable {
    var data: [EventModel]
}
