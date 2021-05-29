//
//  MenuRouter.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class MenuRouter {
    static func createModule() -> MenuView {
        let window = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
        let menuView = MenuView.instantiate()
        window?.addSubview(menuView)
        menuView.translatesAutoresizingMaskIntoConstraints = false

        menuView.topAnchor.constraint(equalTo: window!.topAnchor).isActive = true
        menuView.bottomAnchor.constraint(equalTo: window!.bottomAnchor).isActive = true
        menuView.leadingAnchor.constraint(equalTo: window!.leadingAnchor).isActive = true
        menuView.trailingAnchor.constraint(equalTo: window!.trailingAnchor).isActive = true

        return menuView
    }
}
