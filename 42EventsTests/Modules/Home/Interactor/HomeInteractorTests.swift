//
//  HomeInteractorTests.swift
//  42EventsTests
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import XCTest
@testable import _2Events

class HomeInteractorTests: XCTestCase {

    class HomePresenterMock: HomeInteractorToPresenterProtocol {
        var data: HomeDataModel!
        var error: ErrorType!
        func receiveData(data: HomeDataModel) {
            self.data = data
        }

        func receiveError(error: ErrorType) {
            self.error = error
        }
    }

    var homePresenterMock: HomePresenterMock!
    var homeInteractor: HomeInteractor!
    var apiManagerMock: APIManagerMock!
    var dataCachingManager: DataCachingManager!

    override func setUp() {
        homePresenterMock = HomePresenterMock()
        dataCachingManager = DataCachingManager(fileName: "homeTest")
        apiManagerMock = APIManagerMock()
        homeInteractor = HomeInteractor()
        homeInteractor.dataCachingManager = dataCachingManager
        homeInteractor.presenter = homePresenterMock
        homeInteractor.apiManager = apiManagerMock
        super.setUp()
    }

    override func tearDown() {
        dataCachingManager.deleteLocal()
        UserDefaults.standard.set(nil, forKey: homeInteractor.path)
        homePresenterMock = nil
        dataCachingManager = nil
        apiManagerMock = nil
        homeInteractor = nil
        super.tearDown()
    }

    func testLoadDataFromAPISuccess() {
        let data = Data(homeJsonString.utf8)
        apiManagerMock.data = data
        apiManagerMock.response = HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 200, httpVersion: nil, headerFields: [:])
        homeInteractor.loadData()
        XCTAssertNotNil(homePresenterMock.data)
        XCTAssertNil(homePresenterMock.error)
    }

    func testLoadDataFromAPIFail() {
        let data = Data(homeJSONErrorString.utf8)
        apiManagerMock.data = data
        apiManagerMock.response = HTTPURLResponse(url: URL(string: "google.com")!, statusCode: 200, httpVersion: nil, headerFields: [:])
        homeInteractor.loadData()
        XCTAssertNil(homePresenterMock.data)
        XCTAssertNotNil(homePresenterMock.error)
    }
}
