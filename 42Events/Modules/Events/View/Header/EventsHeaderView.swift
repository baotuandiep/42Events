//
//  EventsHeaderView.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class EventsHeaderView: UIView {

    static func instantiate() -> EventsHeaderView {
        UINib(nibName: "EventsHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? EventsHeaderView ?? EventsHeaderView()
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var showMedalSwitch: UISwitch!

    var switchChangeValue: ((Bool) -> Void)?

    @IBAction func switchToggle(_ sender: UISwitch) {
        switchChangeValue?(sender.isOn)
    }
}
