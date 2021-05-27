//
//  CenterCollectionViewFlowLayout.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class CenterCollectionViewFlowLayout: UICollectionViewFlowLayout {

    // MARK: - Public Variable
    var itemsPerPage = 1
    var paddingLeft: CGFloat = 0

    // MARK: - Private Variables
    private var _currentPage = 0
    private var _previousOffset: CGFloat = 0

    // MARK: - Life Cycle Overrides
    override func prepare() {
        super.prepare()
        scrollDirection = .horizontal
        collectionView?.decelerationRate = .fast
        minimumLineSpacing = (collectionView?.delegate as? UICollectionViewDelegateFlowLayout)?.collectionView?(collectionView ?? UICollectionView(), layout: self, minimumLineSpacingForSectionAt: 0) ?? minimumLineSpacing
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView, let itemsCount = collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: 0) else { return proposedContentOffset }
        let pagesCount = itemsCount / itemsPerPage + ((itemsCount % itemsPerPage) == 0 ? 0 : 1) // Calculate pagesCount by itemsCount and itemsPerPage

        // Calculate current page and scroll offset
        if velocity.x < 0 && (abs(velocity.x) > 1.5 || _previousOffset > collectionView.contentOffset.x) {
            _currentPage = max(_currentPage - 1, 0)
        } else if velocity.x > 0 && (velocity.x > 1.5 || _previousOffset < collectionView.contentOffset.x) {
            _currentPage = min(_currentPage + 1, pagesCount - 1)
        } else if abs(velocity.x) <= 1.5 {
            let distance = collectionView.contentOffset.x - _previousOffset
            if abs(distance) > collectionView.frame.width / 3 {
                _currentPage = distance > 0 ? min(_currentPage + 1, pagesCount - 1) : max(_currentPage - 1, 0)
            }
        }
        let minimumLineSpacing = (collectionView.delegate as? UICollectionViewDelegateFlowLayout)?.collectionView?(collectionView, layout: self, minimumLineSpacingForSectionAt: 0) ?? self.minimumLineSpacing
        var updatedOffset = -paddingLeft
        for i in 0..<_currentPage {
            updatedOffset += ((collectionView.delegate as? UICollectionViewDelegateFlowLayout)?.collectionView?(collectionView, layout: self, sizeForItemAt: [0, i]).width ?? 0) + minimumLineSpacing
        }
        _previousOffset = updatedOffset
        return CGPoint(x: updatedOffset, y: proposedContentOffset.y)
    }

    // MARK: - Public Function
    func updateCurrentDisplay(with page: Int, offset: CGFloat) {
        _currentPage = page
        _previousOffset = offset
    }
}
