//
//  UIView+Extensions.swift
//  42Events
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

extension UIView {
    static var keyWindow: UIView? {
        UIApplication.shared.connectedScenes.filter({ $0.activationState == .foregroundActive })
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first!
    }
}
