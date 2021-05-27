//
//  UICollectionView+Extensions.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(type: T.Type, for indexPath: IndexPath) -> T {
        guard let dequeuedCell = dequeueReusableCell(withReuseIdentifier: T.identifier(), for: indexPath) as? T else {
            fatalError("need to set identifier or register your cell")
        }
        return dequeuedCell
    }

    func registerFromNib(forCellClass cellClass: UICollectionViewCell.Type) {
        register(cellClass.nib(), forCellWithReuseIdentifier: cellClass.identifier())
    }
}
