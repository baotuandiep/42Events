//
//  MenuInteractorTests.swift
//  42EventsTests
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import XCTest
@testable import _2Events

class MenuInteractorTests: XCTestCase {

    class MenuPresenterMock: MenuInteractorToPresenterProtocol {
        var langugeList: [String] = []

        func languagueList(languages: [String], selectedIndex: Int) {
            self.langugeList = languages
        }
    }

    var interactor: MenuInteractor!
    var presenterMock: MenuPresenterMock!

    override func setUp() {
        interactor = MenuInteractor()
        presenterMock = MenuPresenterMock()
        interactor.presenter = presenterMock
        super.setUp()
    }

    func testGetLanguageList() {
        interactor.getLanguageList()
        XCTAssertEqual(interactor.languagueList, presenterMock.langugeList)
    }

    func testSelectLanguage() {
        let index = 2
        interactor.selectLanguage(index: index)
        XCTAssertEqual(index, MenuInteractor.selectedIndex)
    }
}
