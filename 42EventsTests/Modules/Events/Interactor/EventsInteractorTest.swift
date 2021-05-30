//
//  EventsInteractorTest.swift
//  42EventsTests
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import XCTest
@testable import _2Events

let eventsJSONString = """
{
  "code": 200,
  "data": [
    {
      "_id": "3mNpiZgBRTAQuwtJ9",
      "raceIDs": [
        "XRC4Y86XHrEdZtxD2",
        "xgPfRruqgMn4rHg7E",
        "r4j2WgmwcQAb2aBBP"
      ],
      "slug": "2021cyclingseason2",
      "race_name": "21day Cycling Challenge 2021 - Season 2",
      "race_name_lang": {
        "en": "21day Cycling Challenge 2021 - Season 2",
        "cn": "",
        "tw": "",
        "id": "",
        "th": "",
        "vi": ""
      },
      "start_date": "2021-03-31T16:00:00.230Z",
      "end_date": "2021-06-21T15:59:59.824Z",
      "race_type": "21D",
      "sportType": "cycling",
      "medal_engraving_end_date": null,
      "raceRunners": 5,
      "launch_date": "2021-03-07T03:15:00.445Z",
      "is_new": false,
      "isFreeEngraving": false,
      "racePeriod": "01 Apr 2021 (00:00) - 21 Jun 2021 (23:59) GMT +8",
      "racePrice": "Free",
      "eventType": "multiple",
      "banner_card": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/21CyclingS2-WebB-01-jpg-v5u03032021-52559&w=560&h=560&fit=outside",
      "medalViewImage": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/21CyclingS2-E-Badge-View-01-jpg-8te03032021-52559&w=180&h=180&fit=outside",
      "isBundle": true,
      "brandRaceSlug": "",
      "is_brand_race": false,
      "joined": false
    }
  ],
  "totalData": 1,
  "totalPagination": 0,
  "cachedData": false
}
"""
let eventsErrorJSONString = """
{
  "code": 200,
  "data": [
    {
      "_id": "3mNpiZgBRTAQuwtJ9",
      "raceIDs": [
        "XRC4Y86XHrEdZtxD2",
        "xgPfRruqgMn4rHg7E",
        "r4j2WgmwcQAb2aBBP"
      ]
    }
  ],
  "totalData": 1,
  "totalPagination": 0,
  "cachedData": false
}
"""

class EventsInteractorTest: XCTestCase {

    class EventsPresenterMock: EventsInteractorToPresenterProtocol {
        var datas: [EventModel] = []
        var error: ErrorType!
        func receiveData(datas: [EventModel]) {
            self.datas = datas
        }

        func receiveError(error: ErrorType) {
            self.error = error
        }
    }

    var eventsPresenterMock: EventsPresenterMock!
    var eventsInteractor: EventsInteractor!
    var apiManagerMock: APIManagerMock!
    var dataCachingManager: DataCachingManager!

    override func setUp() {
        eventsPresenterMock = EventsPresenterMock()
        eventsInteractor = EventsInteractor(eventType: .cycling)
        eventsInteractor.presenter = eventsPresenterMock
        apiManagerMock = APIManagerMock()
        eventsInteractor.apiManager = apiManagerMock
        dataCachingManager = DataCachingManager(fileName: "EventsInteractorTest")
        super.setUp()
    }

    override func tearDown() {
        dataCachingManager.deleteLocal()
        UserDefaults.standard.set(nil, forKey: eventsInteractor.pathUserDefaultString)
        eventsPresenterMock = nil
        dataCachingManager = nil
        apiManagerMock = nil
        eventsInteractor = nil
        super.tearDown()
    }

    func testLoadDataFromAPISuccess() {
        let data = Data(eventsJSONString.utf8)
        apiManagerMock.data = data
        apiManagerMock.response = HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 200, httpVersion: nil, headerFields: [:])
        eventsInteractor.loadData()
        XCTAssertFalse(eventsPresenterMock.datas.isEmpty)
        XCTAssertNil(eventsPresenterMock.error)
    }

    func testLoadDataFromAPIFail() {
        let data = Data(eventsErrorJSONString.utf8)
        apiManagerMock.data = data
        apiManagerMock.response = HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 200, httpVersion: nil, headerFields: [:])
        eventsInteractor.loadData()
        XCTAssertTrue(eventsPresenterMock.datas.isEmpty)
        XCTAssertNotNil(eventsPresenterMock.error)
    }
}
