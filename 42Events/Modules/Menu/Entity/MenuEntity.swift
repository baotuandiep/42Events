//
//  MenuEntity.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

enum MenuRows: Int, CaseIterable {
    case login
    case signUp
    case guidesAndFAQ
    case contactUs
    case language

    var string: String {
        switch self {
        case .login:
            return "Login"
        case .signUp:
            return "Sign up"
        case .guidesAndFAQ:
            return "Guides and FAQ"
        case .contactUs:
            return "Contact Us"
        case .language:
            return "Language"
        }
    }

    var imageView: UIImage {
        switch self {
        case .login:
            return UIImage(systemName: "square.stack.3d.up.fill")!
        case .signUp:
            return UIImage(systemName: "pencil")!
        case .guidesAndFAQ:
            return UIImage(systemName: "questionmark.circle")!
        case .contactUs:
            return UIImage(systemName: "headphones")!
        case .language:
            return UIImage(named: "change-language")!
        }
    }
}
