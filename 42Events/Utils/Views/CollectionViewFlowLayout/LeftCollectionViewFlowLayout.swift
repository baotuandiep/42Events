//
//  LeftCollectionViewFlowLayout.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class LeftCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributesForElementsInRect = super.layoutAttributesForElements(in: rect)
        var newAttributesForElementsInRect: [UICollectionViewLayoutAttributes] = []
        var leftMargin = sectionInset.left
        if let attributesForElementsInRect = attributesForElementsInRect {
            for attributes in attributesForElementsInRect {
                let indexPath = attributes.indexPath
                let size = itemSize(for: indexPath)
                if attributes.frame.origin.x == sectionInset.left {
                    leftMargin = sectionInset.left
                } else {
                    var newLeftAlignedFrame = attributes.frame
                    newLeftAlignedFrame.origin.x = leftMargin
                    newLeftAlignedFrame.size = size
                    attributes.frame = newLeftAlignedFrame
                }
                leftMargin += attributes.frame.width
                newAttributesForElementsInRect.append(attributes)
            }
        }

        return newAttributesForElementsInRect
    }

    func itemSize(for indexPath: IndexPath) -> CGSize {
        (collectionView?.delegate as? UICollectionViewDelegateFlowLayout)?
            .collectionView?(collectionView ?? UICollectionView(), layout: self, sizeForItemAt: indexPath) ?? itemSize
    }

}
