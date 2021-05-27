//
//  FeatureTableViewCell.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class FeatureTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var datas: [EventModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.registerFromNib(forCellClass: FeatureCollectionViewViewCell.self)
    }

    func setData(datas: [EventModel]) {
        self.datas = datas
        collectionView.reloadData()
    }
}

extension FeatureTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        datas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: FeatureCollectionViewViewCell.self, for: indexPath)
        if let urlImage = URL(string: datas[indexPath.row].bannerCard) {
            cell.cellImageView.downloadImage(url: urlImage)
        }
        return cell
    }
}

extension FeatureTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.frame.size
    }
}
