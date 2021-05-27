//
//  EventsModel.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

struct HomeModel: Decodable {
    var code: Int
    var data: HomeDataModel
}

struct HomeDataModel: Decodable {
    var featured: [EventModel]
    var startingSoon: [EventModel]
}

struct EventModel: Decodable {
    var _id: String
    var raceIDs: [String]
    var slug: String
    var raceName: String
    var raceNameLang: [String: String]
    var startDate: String
    var endDate: String
    var raceType: String
    var sportType: String
    var medalEngravingEndDate: String
    var raceRunners: Int
    var launchDate: String
    var isNew: Bool
    var isFreeEngraving: Bool
    var categories: [String]?
    var racePrice: String?
    var eventType: String
    var bannerCard: String
    var medalViewImage: String
    var brandRaceSlug: String
    var isBrandRace: Bool
    var joined: Bool

//    private enum CodingKeys: String, CodingKey {
//        case isNew = "is_new"
//        case isFreeEngraving
//    }
}
