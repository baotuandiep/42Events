//
//  MenuInteractor.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import Foundation

class MenuInteractor {
    static var selectedIndex = 0
    var languagueList: [String] = ["English", "简体中文", "繁體中文", "Bahasa Indonesia", "ภาษาไทย", "Tiếng Việt"]
    weak var presenter: MenuInteractorToPresenterProtocol?
}

extension MenuInteractor: MenuPresenterToInteractorProtocol {
    func getLanguageList() {
        presenter?.languagueList(languages: languagueList, selectedIndex: Self.selectedIndex)
    }

    func selectLanguage(index: Int) {
        Self.selectedIndex = index
    }
}
