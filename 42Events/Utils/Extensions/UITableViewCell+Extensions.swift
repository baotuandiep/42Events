//
//  UITableViewCell+Extensions.swift
//  42Events
//
//  Created by Tuan Diep on 5/26/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

extension UITableViewCell {
    /// Returns the String describing self.
    static func identifier() -> String {
        String(describing: self)
    }

    /// Returns the UINib with nibName matching the cell's identifier.
    static func nib() -> UINib {
        UINib(nibName: identifier(), bundle: nil)
    }
}
