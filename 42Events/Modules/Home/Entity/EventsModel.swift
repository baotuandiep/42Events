//
//  EventsModel.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

struct HomeModel: Codable {
    var data: HomeDataModel
}

struct HomeDataModel: Codable {
    var featured: [EventModel]
    var startingSoon: [EventModel]
    var popular: [EventModel]
    var newRelease: [EventModel]
    var free: [EventModel]
    var past: [EventModel]
}

struct EventModel: Codable {
    var _id: String
    var raceIDs: [String]
    var slug: String
    var raceName: String
    var raceNameLang: [String: String]
    var startDate: String
    var endDate: String
    var raceType: String
    var sportType: String
    var medalEngravingEndDate: String?
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
    var racePeriod: String

    var detailString: String {
        var values: [String] = []
        if !sportType.isEmpty {
            values.append(sportType.capitalized)
        }
        if raceRunners > 0 {
            values.append("\(raceRunners) joined")
        }
        if let racePrice = racePrice {
            values.append(racePrice)
        }
        return values.joined(separator: " • ")
    }

    var categoriesString: String {
        guard let categories = categories else { return "" }
        return categories.joined(separator: ", ")
    }

    var eventTypeString: String {
        guard !eventType.isEmpty else { return "" }
        return eventType.capitalized + " submission"
    }

    var tags: [String] {
        var values: [String] = []
        if !sportType.isEmpty {
            values.append(sportType.capitalized)
        }
        if raceRunners > 0 {
            values.append("\(raceRunners) joined")
        }
        if let racePrice = racePrice {
            values.append(racePrice)
        }
        if let categories = categories {
            values.append(contentsOf: categories)
        }
        if !eventTypeString.isEmpty {
            values.append(eventTypeString)
        }
        return values
    }
}
