//
//  UITableView+Extensions.swift
//  42Events
//
//  Created by Tuan Diep on 5/26/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, for indexPath: IndexPath) -> T {
        guard let dequeuedCell = dequeueReusableCell(withIdentifier: T.identifier(), for: indexPath) as? T else {
            fatalError("need to set identifier or register your cell")
        }
        return dequeuedCell
    }

    func registerFromNib(forCellClass cellClass: UITableViewCell.Type) {
        register(cellClass.nib(), forCellReuseIdentifier: cellClass.identifier())
    }
}
