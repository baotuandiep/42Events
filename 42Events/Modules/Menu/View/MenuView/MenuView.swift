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
        cell.configure(menu: MenuRows.allCases[indexPath.row], languageString: "English")
        return cell
    }
}

extension MenuView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard MenuRows.allCases[indexPath.row] == .language else { return }
        guard let cell = tableView.cellForRow(at: indexPath) as? MenuTableViewCell else { return }
        let languageView = LanguageView.instantiate()
        languageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(languageView)
        languageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        languageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        languageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        languageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true


        let frameWithCell = cell.valueLabel.superview!.convert(cell.valueLabel.frame, to: cell)
        let frame = cell.convert(frameWithCell, to: self)
        languageView.leadingTableViewConstraint.constant = frame.origin.x - 15
        languageView.topConstraint.constant = frame.origin.y + cell.valueLabel.frame.height + 5
        layoutIfNeeded()
        let languages = ["English", "简体中文", "繁體中文", "Bahasa Indonesia", "ภาษาไทย", "Tiếng Việt"]
        languageView.configure(languages: languages)
        UIView.animate(withDuration: 0.3) {
            languageView.heightConstraint.constant = CGFloat(languages.count) * 30
            languageView.layoutIfNeeded()
        }

        languageView.close = {
            UIView.animate(withDuration: 0.3, animations: {
                languageView.heightConstraint.constant = 0
                languageView.layoutIfNeeded()
            }, completion: { _ in
                languageView.removeFromSuperview()
            })
        }
    }
}


extension MenuView: MenuPresenterToViewProtocol {

}
