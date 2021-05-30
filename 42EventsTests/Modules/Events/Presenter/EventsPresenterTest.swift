//
//  EventsPresenterTest.swift
//  42EventsTests
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import XCTest
@testable import _2Events

class EventsPresenterTest: XCTestCase {

    class EventsInteractorMock: EventsPresenterToInteractorProtocol {
        var presenter: EventsInteractorToPresenterProtocol?
        var isCalledLoadData: Bool = false
        func loadData() {
            isCalledLoadData = true
        }
    }

    class EventsRouterMock: EventsPresenterToRouterProtocol {
        var view: UIView!
        var isCalledShowView: Bool = false
        func showMenu(view: UIView) {
            self.view = view
            isCalledShowView = true
        }
    }

    class EventsViewMock: EventsPresenterToViewProtocol {
        var datas: [EventModel] = []
        var onCallReceiveData: (() -> Void)?
        var onCallShowError: (() -> Void)?
        var isCalledShowError = false
        var isCalledShowLoadingView = false

        func receiveData(datas: [EventModel]) {
            self.datas = datas
            onCallReceiveData?()
        }

        func showErrorView(errorString: String) {
            isCalledShowError = true
            onCallShowError?()
        }

        func showLoadingView() {
            isCalledShowLoadingView = true
        }
    }

    var interactorMock: EventsInteractorMock!
    var routerMock: EventsRouterMock!
    var viewMock: EventsViewMock!
    var presenter: EventsPresenter!

    override func setUp() {
        interactorMock = EventsInteractorMock()
        routerMock = EventsRouterMock()
        viewMock = EventsViewMock()
        presenter = EventsPresenter(eventType: .cycling)
        presenter.interactor = interactorMock
        presenter.view = viewMock
        presenter.router = routerMock
        super.setUp()
    }

    func testLoadDataFunction() {
        presenter.loadData()
        XCTAssertTrue(viewMock.isCalledShowLoadingView)
        XCTAssertTrue(interactorMock.isCalledLoadData)
    }

    func testShowMenu() {
        let view = UIView()
        presenter.showMenu(view: view)
        XCTAssertTrue(routerMock.isCalledShowView)
        XCTAssertEqual(routerMock.view, view)
    }

    func testReceiveDataFunction() {
        let data = Data(eventsJSONString.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try! decoder.decode(EventsModel.self, from: data)

        let promise = expectation(description: "testReceiveDataFunction")
        presenter.receiveData(datas: result.data)
        viewMock.onCallReceiveData = {
            promise.fulfill()
        }

        wait(for: [promise], timeout: 5)
        XCTAssertFalse(viewMock.datas.isEmpty)
    }

    func testReceiveErrorFunction() {
        let promise = expectation(description: "testReceiveErrorFunction")
        presenter.receiveError(error: .noData)
        viewMock.onCallShowError = {
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)
        XCTAssertTrue(viewMock.isCalledShowError)
    }
}
