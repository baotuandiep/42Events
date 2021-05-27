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
        var currentY: CGFloat = 0
        if let attributesForElementsInRect = attributesForElementsInRect {
            for attributes in attributesForElementsInRect {
                let indexPath = attributes.indexPath
                let size = itemSize(for: indexPath)
                if currentY != attributes.frame.origin.y {
                    leftMargin = sectionInset.left
                    currentY = attributes.frame.origin.y
                    attributes.frame.origin.x = leftMargin
                } else {
                    var newLeftAlignedFrame = attributes.frame
                    newLeftAlignedFrame.origin.x = leftMargin
                    newLeftAlignedFrame.size = size
                    attributes.frame = newLeftAlignedFrame
                }
                leftMargin += attributes.frame.width + minimumInteritemSpacing
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
