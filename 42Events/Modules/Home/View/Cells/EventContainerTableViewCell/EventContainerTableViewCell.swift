//
//  EventContainerTableViewCell.swift
//  42Events
//
//  Created by Tuan Diep on 5/28/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class EventContainerTableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!

    var touchedOnEvent: ((EventsType) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.subviews.forEach {
            $0.layer.cornerRadius = 10
        }
    }

    @IBAction func eventsButtonTouch(_ sender: UIButton) {
        guard EventsType.allCases.count > sender.tag else { return }
        touchedOnEvent?(EventsType.allCases[sender.tag])
    }
}
