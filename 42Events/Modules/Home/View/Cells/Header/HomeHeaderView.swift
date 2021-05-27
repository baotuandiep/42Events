//
//  HomeHeaderView.swift
//  42Events
//
//  Created by Tuan Diep on 5/28/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {
    static func instantiate() -> HomeHeaderView {
        UINib(nibName: "HomeHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? HomeHeaderView ?? HomeHeaderView()
    }
    
    @IBOutlet weak var titleLabel: UILabel!
}
