//
//  NormalTableViewCell.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class NormalTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    var datas: [EventModel] = []

    let padding: CGFloat = 50

    private var currentTagHeight = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.registerFromNib(forCellClass: NormalCollectionViewCell.self)
    }

    func setData(datas: [EventModel]) {
        self.datas = datas
        let customLayout = CenterCollectionViewFlowLayout()
        customLayout.paddingLeft = padding / 2
        collectionView.contentInset.left = customLayout.paddingLeft
        collectionView.contentInset.right = customLayout.paddingLeft
        collectionView.collectionViewLayout = customLayout
        collectionView.reloadData()
    }
}

extension NormalTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        datas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: NormalCollectionViewCell.self, for: indexPath)
        return cell
    }
}

extension NormalTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - padding, height: collectionViewHeightConstraint.constant)
    }
}
