//
//  APIManagerTests.swift
//  42EventsTests
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import XCTest
@testable import _2Events

class APIManagerTests: XCTestCase {
    var apiManager: APIManagerMock!

    override func setUp() {
        print("test setup")
        apiManager = APIManagerMock()
    }

    func testExample() throws {

    }

    func testCallAPIWithCorrectData() {
        let promise = expectation(description: "testCallAPIWithCorrectData")
        var result: APIResult<HomeModel>!
        let jsonString = """
        {
          "code": 200,
          "data": {
            "featured": [
              {
                "_id": "chj8aW9DAHScYoREk",
                "raceIDs": [
                  "chj8aW9DAHScYoREk"
                ],
                "slug": "hashtag-event-test 111",
                "race_name": "Mikey's Big Race Bonanza",
                "race_name_lang": {
                  "cn": "",
                  "tw": "",
                  "id": "",
                  "th": "",
                  "vi": ""
                },
                "start_date": "2021-01-14T09:00:00.160Z",
                "end_date": "2022-02-25T15:59:59.160Z",
                "race_type": "challenge",
                "sportType": "running",
                "medal_engraving_end_date": "2021-12-17T15:59:59.748Z",
                "raceRunners": 18,
                "launch_date": "2021-01-06T10:25:11.635Z",
                "is_new": false,
                "isFreeEngraving": true,
                "racePeriod": "14 Jan 2021 (17:00) - 25 Feb 2022 (23:59) GMT +8",
                "categories": [
                  "1km",
                  "2.5km",
                  "5.5km"
                ],
                "racePrice": "Free",
                "eventType": "multiple",
                "banner_card": "https://images.weserv.nl/?url=https://wallpapercave.com/wp/wp3652104.jpg",
                "medalViewImage": "https://images.weserv.nl/?url=https://wallpapercave.com/wp/wp3652104.jpg",
                "isBundle": false,
                "brandRaceSlug": "",
                "is_brand_race": false,
                "joined": false
              }
            ],
            "startingSoon": [
              {
                "_id": "ySTsnE7td3s2RTJEX",
                "raceIDs": [
                  "ySTsnE7td3s2RTJEX"
                ],
                "slug": "50dayrunningthai2020",
                "race_name": "[Test] 50 Day Running Challenge - Thailand",
                "race_name_lang": {
                  "cn": "",
                  "tw": "",
                  "id": "",
                  "th": "",
                  "vi": ""
                },
                "start_date": "2021-01-01T15:59:59.723Z",
                "end_date": "2031-01-29T15:59:59.723Z",
                "race_type": "virtual_race",
                "sportType": "running",
                "medal_engraving_end_date": "2031-01-05T06:55:59.135Z",
                "raceRunners": 11,
                "launch_date": "2020-10-05T01:00:00.105Z",
                "is_new": false,
                "isFreeEngraving": true,
                "racePeriod": "01 Jan 2021 (23:59) - 29 Jan 2031 (23:59) GMT +8",
                "categories": [
                  "2.4km"
                ],
                "racePrice": "S$ 9.99",
                "eventType": "single",
                "banner_card": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/-test-50day-running-challenge-thai-banner-top-of-webpage-jpg-21u09122020-33924",
                "medalViewImage": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/default-medal-view-banner-2x-jpg-26j10052019-114501",
                "isBundle": false,
                "brandRaceSlug": "",
                "is_brand_race": false,
                "joined": false
              },
              {
                "_id": "vkRbqCeYWssaNyTMv",
                "raceIDs": [
                  "vkRbqCeYWssaNyTMv"
                ],
                "slug": "ruNTUgether",
                "race_name": "ruNTUgether",
                "race_name_lang": {
                  "cn": "",
                  "tw": "",
                  "id": "",
                  "th": "",
                  "vi": ""
                },
                "start_date": "2021-01-14T16:00:00.590Z",
                "end_date": "2021-03-28T15:59:59.590Z",
                "race_type": "challenge",
                "sportType": "running",
                "medal_engraving_end_date": "2021-01-15T15:59:59.767Z",
                "raceRunners": 11,
                "launch_date": "2020-11-01T01:00:00.559Z",
                "is_new": false,
                "isFreeEngraving": false,
                "racePeriod": "15 Jan 2021 (00:00) - 28 Mar 2021 (23:59) GMT +8",
                "categories": [
                  "3km",
                  "10km",
                  "Half Marathon 21.0975km",
                  "Marathon 42.195km"
                ],
                "racePrice": "S$ 9.99",
                "eventType": "multiple",
                "banner_card": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/1-RuNTUgether-Banner-jpg-lhb07012021-55414",
                "medalViewImage": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/images1-002-png-azl06012021-83131",
                "isBundle": false,
                "brandRaceSlug": "",
                "is_brand_race": false,
                "joined": false
              }
            ],
            "popular": [
              {
                "_id": "d2Cjw5BiWrfkhBXnD",
                "raceIDs": [
                  "d2Cjw5BiWrfkhBXnD"
                ],
                "slug": "christmas2020",
                "race_name": "Christmas Virtual Run 2020",
                "race_name_lang": {
                  "cn": "",
                  "tw": "",
                  "id": "",
                  "th": "",
                  "vi": ""
                },
                "start_date": "2021-12-03T16:00:00.725Z",
                "end_date": "2021-12-31T15:59:59.725Z",
                "race_type": "virtual_race",
                "sportType": "running",
                "medal_engraving_end_date": "2021-12-31T15:59:59.107Z",
                "raceRunners": 23,
                "launch_date": "2020-10-01T01:00:00.357Z",
                "is_new": false,
                "isFreeEngraving": true,
                "racePeriod": "04 Dec 2021 (00:00) - 31 Dec 2021 (23:59) GMT +8",
                "categories": [
                  "3km",
                  "5km",
                  "10km",
                  "Half Marathon 21.0975km"
                ],
                "racePrice": "S$ 9.99",
                "eventType": "single",
                "banner_card": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Web-Banner-B-3-jpg-k4b02102020-80717",
                "medalViewImage": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Medal-View-11-jpg-5mv02102020-80717",
                "isBundle": false,
                "brandRaceSlug": "",
                "is_brand_race": false,
                "joined": false
              },
              {
                "_id": "aFiRnZ6wmgJhnneJG",
                "raceIDs": [
                  "d2Cjw5BiWrfkhBXnD"
                ],
                "slug": "christmas2020",
                "race_name": "Christmas Virtual Run 2020",
                "race_name_lang": {
                  "en": "Christmas Virtual Run 2020",
                  "cn": "",
                  "tw": "",
                  "id": "",
                  "th": "",
                  "vi": ""
                },
                "start_date": "2021-12-03T16:00:00.725Z",
                "end_date": "2021-12-31T15:59:59.725Z",
                "race_type": "virtual_race",
                "sportType": "running",
                "medal_engraving_end_date": "2021-12-31T15:59:59.107Z",
                "raceRunners": 23,
                "launch_date": "2020-10-01T01:14:37.313Z",
                "is_new": false,
                "isFreeEngraving": true,
                "racePeriod": "04 Dec 2021 (00:00) - 31 Dec 2021 (23:59) GMT +8",
                "eventType": "single",
                "banner_card": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Web-Banner-B-3-jpg-k4b02102020-80717",
                "medalViewImage": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Medal-View-11-jpg-5mv02102020-80717",
                "isBundle": true,
                "brandRaceSlug": "",
                "is_brand_race": false,
                "joined": false
              }
            ],
            "newRelease": [
              {
                "_id": "YJLk5RbAPRBcejvjJ",
                "raceIDs": [
                  "sFERPv4YaBpksSBW3"
                ],
                "slug": "wingedlion2021",
                "race_name": "Winged Lion Virtual Run 2021",
                "race_name_lang": {
                  "en": "Winged Lion Virtual Run 2021",
                  "cn": "",
                  "tw": "",
                  "id": "",
                  "th": "",
                  "vi": ""
                },
                "start_date": "2021-03-23T16:00:00.331Z",
                "end_date": "2021-05-16T15:59:59.331Z",
                "race_type": "virtual_race",
                "sportType": "running",
                "medal_engraving_end_date": "2021-03-28T15:59:59.080Z",
                "raceRunners": 0,
                "launch_date": "2021-03-21T06:54:46.398Z",
                "is_new": false,
                "isFreeEngraving": true,
                "racePeriod": "24 Mar 2021 (00:00) - 16 May 2021 (23:59) GMT +8",
                "eventType": "single",
                "banner_card": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/WEB-BANNER-B-LION-jpg-ad417032021-34729",
                "medalViewImage": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Medal-View-3-6-jpg-2c417032021-35552",
                "isBundle": true,
                "brandRaceSlug": "",
                "is_brand_race": false,
                "joined": false
              },
              {
                "_id": "sABqFErniz6H7KRYQ",
                "raceIDs": [
                  "humyTTdXgemFfth8F"
                ],
                "slug": "walkingcroatia",
                "race_name": "Wanderlust Walking Challenge Apr 2021 - Croatia",
                "race_name_lang": {
                  "en": "Wanderlust Walking Challenge Apr 2021 - Croatia",
                  "cn": "",
                  "tw": "",
                  "id": "",
                  "th": "",
                  "vi": ""
                },
                "start_date": "2021-03-22T16:00:00.698Z",
                "end_date": "2021-04-30T15:59:59.698Z",
                "race_type": "challenge",
                "sportType": "walking",
                "medal_engraving_end_date": null,
                "raceRunners": 0,
                "launch_date": "2021-03-14T18:50:48.504Z",
                "is_new": false,
                "isFreeEngraving": false,
                "racePeriod": "23 Mar 2021 (00:00) - 30 Apr 2021 (23:59) GMT +8",
                "racePrice": "Free",
                "eventType": "multiple",
                "banner_card": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Wanderlust-WB-B-Apr-01-jpg-g2x15032021-82838",
                "medalViewImage": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Wanderlust-eBadgeView-Apr-01-jpg-0ko15032021-82838",
                "isBundle": true,
                "brandRaceSlug": "",
                "is_brand_race": false,
                "joined": false
              }
            ],
            "free": [
              {
                "_id": "sABqFErniz6H7KRYQ",
                "raceIDs": [
                  "humyTTdXgemFfth8F"
                ],
                "slug": "walkingcroatia",
                "race_name": "Wanderlust Walking Challenge Apr 2021 - Croatia",
                "race_name_lang": {
                  "en": "Wanderlust Walking Challenge Apr 2021 - Croatia",
                  "cn": "",
                  "tw": "",
                  "id": "",
                  "th": "",
                  "vi": ""
                },
                "start_date": "2021-03-22T16:00:00.698Z",
                "end_date": "2021-04-30T15:59:59.698Z",
                "race_type": "challenge",
                "sportType": "walking",
                "medal_engraving_end_date": null,
                "raceRunners": 0,
                "launch_date": "2021-03-14T18:50:48.504Z",
                "is_new": false,
                "isFreeEngraving": false,
                "racePeriod": "23 Mar 2021 (00:00) - 30 Apr 2021 (23:59) GMT +8",
                "racePrice": "Free",
                "eventType": "multiple",
                "banner_card": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Wanderlust-WB-B-Apr-01-jpg-g2x15032021-82838",
                "medalViewImage": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Wanderlust-eBadgeView-Apr-01-jpg-0ko15032021-82838",
                "isBundle": true,
                "brandRaceSlug": "",
                "is_brand_race": false,
                "joined": false
              },
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
                "start_date": "2021-03-22T16:00:00.824Z",
                "end_date": "2021-05-21T15:59:59.442Z",
                "race_type": "21D",
                "sportType": "cycling",
                "medal_engraving_end_date": null,
                "raceRunners": 1,
                "launch_date": "2021-03-07T03:15:00.445Z",
                "is_new": false,
                "isFreeEngraving": false,
                "racePeriod": "23 Mar 2021 (00:00) - 21 May 2021 (23:59) GMT +8",
                "racePrice": "Free",
                "eventType": "multiple",
                "banner_card": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/21CyclingS2-WebB-01-jpg-v5u03032021-52559",
                "medalViewImage": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/21CyclingS2-E-Badge-View-01-jpg-8te03032021-52559",
                "isBundle": true,
                "brandRaceSlug": "",
                "is_brand_race": false,
                "joined": false
              }
            ],
            "past": [
              {
                "_id": "bj5noPrJvWWEpW68R",
                "raceIDs": [
                  "bj5noPrJvWWEpW68R"
                ],
                "slug": "walkingdubai",
                "race_name": "Wanderlust Walking Challenge Feb 2021 - Dubai",
                "race_name_lang": {
                  "cn": "",
                  "tw": "",
                  "id": "",
                  "th": "",
                  "vi": ""
                },
                "start_date": "2021-01-24T16:00:00.494Z",
                "end_date": "2021-02-28T15:59:59.494Z",
                "race_type": "challenge",
                "sportType": "walking",
                "medal_engraving_end_date": null,
                "raceRunners": 4,
                "launch_date": "2020-12-07T01:00:00.542Z",
                "is_new": false,
                "isFreeEngraving": false,
                "racePeriod": "25 Jan 2021 (00:00) - 28 Feb 2021 (23:59) GMT +8",
                "categories": [
                  "100k steps",
                  "200k steps",
                  "300k steps"
                ],
                "racePrice": "Free",
                "eventType": "multiple",
                "banner_card": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Wanderlust-WB-B-Feb-01-jpg-vz512012021-92224",
                "medalViewImage": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Wanderlust-eBadgeView-Feb-01-jpg-vyz12012021-92224",
                "isBundle": false,
                "brandRaceSlug": "",
                "is_brand_race": false,
                "joined": false
              },
              {
                "_id": "P6KZ4BYrMJ3oG8ydZ",
                "raceIDs": [
                  "P6KZ4BYrMJ3oG8ydZ"
                ],
                "slug": "sprint21test",
                "race_name": "sprint 21 test event",
                "race_name_lang": {
                  "cn": "",
                  "tw": "",
                  "id": "",
                  "th": "",
                  "vi": ""
                },
                "start_date": "2021-01-01T16:00:00.385Z",
                "end_date": "2021-02-28T15:59:59.385Z",
                "race_type": "challenge",
                "sportType": "running",
                "medal_engraving_end_date": "2020-11-19T15:59:59.385Z",
                "raceRunners": 100,
                "launch_date": "2020-11-25T01:00:00.066Z",
                "is_new": false,
                "isFreeEngraving": false,
                "racePeriod": "02 Jan 2021 (00:00) - 28 Feb 2021 (23:59) GMT +8",
                "categories": [
                  "3km",
                  "5km"
                ],
                "racePrice": "Free",
                "eventType": "multiple",
                "banner_card": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Web-Banner-B-jpg-6cd04092020-72239",
                "medalViewImage": "https://images.weserv.nl/?url=https://virtual-race-submissions.s3-ap-southeast-1.amazonaws.com/images/Medal-View-jpg-h7y25082020-100408",
                "isBundle": false,
                "brandRaceSlug": "",
                "is_brand_race": false,
                "joined": false
              }
            ]
          }
        }
        """
        let data = Data(jsonString.utf8)
        apiManager.data = data
        apiManager.response = HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 200, httpVersion: nil, headerFields: [:])
        apiManager.loadData(type: HomeModel.self, path: "", queryParams: [:]) { (response) in
            result = response
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNotNil(result)
        switch result! {
        case .success(let data):
            XCTAssertEqual(data.data.featured.count, 1)
            XCTAssertEqual(data.data.free.count, 2)
            XCTAssertEqual(data.data.newRelease.count, 2)
            XCTAssertEqual(data.data.past.count, 2)
            XCTAssertEqual(data.data.popular.count, 2)
            XCTAssertEqual(data.data.startingSoon.count, 2)
        case .error:
            XCTFail("should not error here")
        }
    }

    func testCallAPIWithErrorJSONFormat() {
        let promise = expectation(description: "testCallAPIWithErrorJSONFormat")
        var result: APIResult<HomeModel>!
        let jsonString = """
        {
        "data": {
          "featured": [
            {
              "_id": "chj8aW9DAHScYoREk",
              "raceIDs": [
                "chj8aW9DAHScYoREk"
              ],
              "slug": "hashtag-event-test 111",
              "race_name": "Mikey's Big Race Bonanza",
              "race_name_lang": {
                "cn": "",
                "tw": "",
                "id": "",
                "th": "",
                "vi": ""
              },
              "start_date": "2021-01-14T09:00:00.160Z",
              "end_date": "2022-02-25T15:59:59.160Z",
              "race_type": "challenge",
              "sportType": "running",
              "medal_engraving_end_date": "2021-12-17T15:59:59.748Z",
              "raceRunners": 18,
              "launch_date": "2021-01-06T10:25:11.635Z",
              "is_new": false,
              "isFreeEngraving": true,
              "racePeriod": "14 Jan 2021 (17:00) - 25 Feb 2022 (23:59) GMT +8",
              "categories": [
                "1km",
                "2.5km",
                "5.5km"
              ],
              "racePrice": "Free",
              "eventType": "multiple",
              "banner_card": "https://images.weserv.nl/?url=https://wallpapercave.com/wp/wp3652104.jpg",
              "medalViewImage": "https://images.weserv.nl/?url=https://wallpapercave.com/wp/wp3652104.jpg",
              "isBundle": false,
              "brandRaceSlug": "",
              "is_brand_race": false,
              "joined": false
            }
          ],
        }
        }
        """
        let data = Data(jsonString.utf8)
        apiManager.data = data
        apiManager.response = HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 200, httpVersion: nil, headerFields: [:])
        apiManager.loadData(type: HomeModel.self, path: "", queryParams: [:]) { (response) in
            result = response
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNotNil(result)
        switch result! {
        case .success:
            XCTFail("should not success here")
        case .error(let error):
            switch error {
            case .dataError:
                XCTAssertTrue(true)
            default:
                XCTFail("only value dataError is allowed here")
            }
        }
    }

    func testCallAPIWithNoData() {
        let promise = expectation(description: "testCallAPIWithNoData")
        var result: APIResult<HomeModel>!
        apiManager.response = HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 200, httpVersion: nil, headerFields: [:])
        apiManager.loadData(type: HomeModel.self, path: "", queryParams: ["key":"value"]) { (response) in
            result = response
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNotNil(result)
        switch result! {
        case .success:
            XCTFail("should not success here")
        case .error(let error):
            switch error {
            case .noData:
                XCTAssertTrue(true)
            default:
                XCTFail("only value noData is allowed here")
            }
        }
    }

    func testCallAPIWith404Code() {
        let promise = expectation(description: "testCallAPIWith404Code")
        var result: APIResult<HomeModel>!
        apiManager.response = HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 404, httpVersion: nil, headerFields: [:])
        apiManager.loadData(type: HomeModel.self, path: "", queryParams: [:]) { (response) in
            result = response
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNotNil(result)
        switch result! {
        case .success:
            XCTFail("should not success here")
        case .error(let error):
            switch error {
            case .noData:
                XCTAssertTrue(true)
            default:
                XCTFail("only value noData is allowed here")
            }
        }
    }

    func testCallAPIWithClientError() {
        let promise = expectation(description: "testCallAPIWithClientError")
        var result: APIResult<HomeModel>!
        apiManager.response = HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 400, httpVersion: nil, headerFields: [:])
        apiManager.loadData(type: HomeModel.self, path: "", queryParams: [:]) { (response) in
            result = response
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNotNil(result)
        switch result! {
        case .success:
            XCTFail("should not success here")
        case .error(let error):
            switch error {
            case .clientError:
                XCTAssertTrue(true)
            default:
                XCTFail("only value clientError is allowed here")
            }
        }
    }

    func testCallAPIWithServerError() {
        let promise = expectation(description: "testCallAPIWithServerError")
        var result: APIResult<HomeModel>!
        apiManager.response = HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 500, httpVersion: nil, headerFields: [:])
        apiManager.loadData(type: HomeModel.self, path: "", queryParams: [:]) { (response) in
            result = response
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNotNil(result)
        switch result! {
        case .success:
            XCTFail("should not success here")
        case .error(let error):
            switch error {
            case .serverError:
                XCTAssertTrue(true)
            default:
                XCTFail("only value serverError is allowed here")
            }
        }
    }

    func testCallAPIWithRequestError() {
        let promise = expectation(description: "testCallAPIWithRequestError")
        var result: APIResult<HomeModel>!
        apiManager.error = NSError(domain: "error", code: 0, userInfo: [:])
        apiManager.loadData(type: HomeModel.self, path: "", queryParams: [:]) { (response) in
            result = response
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNotNil(result)
        switch result! {
        case .success:
            XCTFail("should not success here")
        case .error(let error):
            switch error {
            case .requestError:
                XCTAssertTrue(true)
            default:
                XCTFail("only value requestError is allowed here")
            }
        }
    }

    func testCallAPIWithUnknowError() {
        let promise = expectation(description: "testCallAPIWithUnknowError")
        var result: APIResult<HomeModel>!
        apiManager.response = HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 100, httpVersion: nil, headerFields: [:])
        apiManager.loadData(type: HomeModel.self, path: "", queryParams: [:]) { (response) in
            result = response
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNotNil(result)
        switch result! {
        case .success:
            XCTFail("should not success here")
        case .error(let error):
            switch error {
            case .unknow:
                XCTAssertTrue(true)
            default:
                XCTFail("only value unknow is allowed here")
            }
        }
    }
}

enum APIManagerFunction {
    case handleRequest
    case handleDataResponse
}

class APIManagerMock: APIManager {
    var data: Data?
    var response: URLResponse?
    var error: Error?

    override func handleRequest<T>(type: T.Type, url: URL, completion: @escaping ((APIResult<T>) -> Void)) where T : Decodable {
        handleDataResponse(data: data, response: response, error: error, completion: completion)
    }
}
