//
//  HomePresenterTests.swift
//  42EventsTests
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import XCTest
@testable import _2Events

class HomePresenterTests: XCTestCase {

    class HomeRouterMock: HomePresenterToRouterProtocol {
        var pushToEventScreen = false
        var isCallShowMenu = false
        var view: UIView!
        func pushToEventScreen(navigationController: UINavigationController, eventType: EventsType) {
            pushToEventScreen = true
        }

        func showMenu(view: UIView) {
            isCallShowMenu = true
            self.view = view
        }
    }

    class HomeViewMock: HomePresenterToViewProtocol {
        var data: HomeDataModel!
        var isShowError: Bool = false
        var isShowLoading: Bool = false

        var onReceiveData: (() -> Void)?
        var onReceiveError: (() -> Void)?

        func receiveData(data: HomeDataModel) {
            self.data = data
            onReceiveData?()
        }

        func showErrorView(errorString: String) {
            isShowError = true
            onReceiveError?()
        }

        func showLoadingView() {
            isShowLoading = true
        }
    }

    class HomeInteractorMock: HomePresenterToInteractorProtocol {
        var presenter: HomeInteractorToPresenterProtocol?
        var isCallLoadData: Bool = false

        func loadData() {
            isCallLoadData = true
        }
    }

    var viewMock: HomeViewMock!
    var routerMock: HomeRouterMock!
    var interactorMock: HomeInteractorMock!
    var presenter: HomePresenter!

    override func setUp() {
        viewMock = HomeViewMock()
        routerMock = HomeRouterMock()
        interactorMock = HomeInteractorMock()
        presenter = HomePresenter()
        presenter.view = viewMock
        presenter.router = routerMock
        presenter.interactor = interactorMock
        super.setUp()
    }

    func testLoadDataFunction() {
        presenter.loadData()
        XCTAssertTrue(viewMock.isShowLoading)
        XCTAssertTrue(interactorMock.isCallLoadData)
    }

    func testTouchedOnEventFunction() {
        presenter.touchedOnEvent(navigationController: UINavigationController(), eventType: .cycling)
        XCTAssertTrue(routerMock.pushToEventScreen)
    }

    func testShowMenuFunction() {
        let view = UIView()
        presenter.showMenu(view: view)
        XCTAssertTrue(routerMock.isCallShowMenu)
        XCTAssertEqual(view, routerMock.view)
    }

    func testReceiveDataFunction() {
        let data = Data(homeJsonString.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try! decoder.decode(HomeModel.self, from: data)

        let promise = expectation(description: "testReceiveDataFunction")
        presenter.receiveData(data: result.data)
        viewMock.onReceiveData = {
            promise.fulfill()
        }

        wait(for: [promise], timeout: 5)
        XCTAssertNotNil(viewMock.data)
    }

    func testReceiveErrorFunction() {
        let promise = expectation(description: "testReceiveErrorFunction")
        presenter.receiveError(error: .noData)
        viewMock.onReceiveError = {
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)
        XCTAssertTrue(viewMock.isShowError)
    }
}
