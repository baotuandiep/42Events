//
//  MenuView.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class MenuView: UIView {
    static func instantiate() -> MenuView {
        UINib(nibName: "MenuView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? MenuView ?? MenuView()
    }

    @IBOutlet weak var tableView: UITableView!

    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.registerFromNib(forCellClass: MenuTableViewCell.self)
    }

}

extension MenuView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MenuRows.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: MenuTableViewCell.self, for: indexPath)
//        cell.configureData(data: datas[indexPath.row], isShowMedal: isShowMedal)
        cell.configure(menu: MenuRows.allCases[indexPath.row])
        return cell
    }
}

extension MenuView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}
