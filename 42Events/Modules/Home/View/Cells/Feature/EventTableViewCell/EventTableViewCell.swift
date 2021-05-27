//
//  EventTableViewCell.swift
//  42Events
//
//  Created by Tuan Diep on 5/28/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.subviews.forEach {
            $0.layer.cornerRadius = 10
        }
    }
}
