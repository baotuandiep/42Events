//
//  EventsTableViewCell.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    @IBOutlet weak var normalContainerView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightCoinstraint: NSLayoutConstraint!

    @IBOutlet weak var medalContainerView: UIView!
    @IBOutlet weak var medalImageView: UIImageView!
    @IBOutlet weak var medalTitleLabel: UILabel!
    @IBOutlet weak var medalDateLabel: UILabel!
    @IBOutlet weak var medalDetailLabel: UILabel!
    @IBOutlet weak var medalCategogiesLabel: UILabel!
    @IBOutlet weak var medalTypeLabel: UILabel!


    var data: EventModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.collectionViewLayout = LeftCollectionViewFlowLayout()
        collectionView.registerFromNib(forCellClass: TagCollectionViewCell.self)
        titleImageView.layer.cornerRadius = 10
        medalImageView.layer.cornerRadius = 10
    }

    func configureData(data: EventModel, isShowMedal: Bool) {
        guard self.data?._id != data._id else { return }
        self.data = data

        medalContainerView.isHidden = !isShowMedal
        normalContainerView.isHidden = isShowMedal
        if isShowMedal {
            medalDateLabel.text = data.racePeriod
            medalTitleLabel.text = data.raceName
            medalDetailLabel.text = data.detailString
            medalCategogiesLabel.text = data.categoriesString
            medalCategogiesLabel.isHidden = data.categories == nil
            medalTypeLabel.text = data.eventTypeString
            if let url = URL(string: data.medalViewImage) {
                medalImageView.downloadImage(url: url)
            }
        } else {
            dateLabel.text = data.racePeriod
            titleLabel.text = data.raceName
            if let url = URL(string: data.bannerCard) {
                titleImageView.downloadImage(url: url)
            }
            collectionView.reloadData()
            layoutIfNeeded()
            collectionViewHeightCoinstraint.constant = collectionView.contentSize.height
        }
    }
}

extension EventsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data == nil ? 0 : data!.tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: TagCollectionViewCell.self, for: indexPath)
        if let data = data {
            cell.tagLabel.text = data.tags[indexPath.row]
        }
        return cell
    }
}

extension EventsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let data = data else { return .zero }

        let width = NSAttributedString(string: data.tags[indexPath.row], attributes: [.font: UIFont.systemFont(ofSize: 12)]).size().width
        return CGSize(width: width + 20, height: 30)
    }
}
