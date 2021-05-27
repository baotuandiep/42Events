//
//  NormalCollectionViewCell.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class NormalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!

    var data: EventModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.collectionViewLayout = LeftCollectionViewFlowLayout()
        collectionView.registerFromNib(forCellClass: TagCollectionViewCell.self)
    }
}

extension NormalCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data == nil ? 0 : data!.tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: TagCollectionViewCell.self, for: indexPath)
        return cell
    }
}

extension NormalCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        <#code#>
    }
}
