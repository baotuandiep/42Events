//
//  MenuPresenterTests.swift
//  42EventsTests
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import XCTest
@testable import _2Events

class MenuPresenterTests: XCTestCase {

    class MenuInteractorMock: MenuPresenterToInteractorProtocol {
        var presenter: MenuInteractorToPresenterProtocol?
        var isCallGetLanguage = false
        var isCallSelectLanguage = false
        var index = 0
        func getLanguageList() {
            isCallGetLanguage = true
        }


        func selectLanguage(index: Int) {
            isCallSelectLanguage = true
            self.index = index
        }
    }

    class MenuViewMock: MenuPresenterToViewProtocol {
        var superview: UIView!
        var isCallCloseView = false
        var languages: [String] = []
        func showView(superview: UIView) {
            self.superview = superview
        }

        func closeView() {
            isCallCloseView = true
        }

        func languageList(languages: [String], selectedIndex: Int) {
            self.languages = languages
        }
    }

    var interactorMock: MenuInteractorMock!
    var viewMock: MenuViewMock!
    var presenter: MenuPresenter!

    override func setUp() {
        interactorMock = MenuInteractorMock()
        viewMock = MenuViewMock()
        presenter = MenuPresenter()
        presenter.interactor = interactorMock
        presenter.view = viewMock
        super.setUp()
    }

    func testGetLanguageListFunction() {
        presenter.getLanguageList()
        XCTAssertTrue(interactorMock.isCallGetLanguage)
    }

    func testSelectLanguageFunction() {
        let index = 1
        presenter.selectLanguage(index: index)
        XCTAssertTrue(interactorMock.isCallSelectLanguage)
    }

    func testLanguagueListFunction() {
        let list = ["hi", "hello"]
        let index = 1
        presenter.languagueList(languages: list, selectedIndex: index)
        XCTAssertEqual(viewMock.languages, list)
    }

    func testShowViewFunction() {
        let view = UIView()
        presenter.showView(superview: view)
        XCTAssertEqual(view, viewMock.superview)
    }

    func testCloseView() {
        presenter.closeView()
        XCTAssertTrue(viewMock.isCallCloseView)
    }
}
