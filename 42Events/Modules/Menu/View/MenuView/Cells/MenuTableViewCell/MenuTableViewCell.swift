//
//  MenuTableViewCell.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    func configure(menu: MenuRows, languageString: String) {
        valueLabel.isHidden = menu != .language
        valueLabel.text = languageString
        titleLabel.text = menu.string
        titleImageView.image = menu.imageView
    }
}
