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
    var presenter: MenuViewToPresenterProtocol?
    var languages: [String] = []
    var selectedIndex = 0

    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?

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
        cell.configure(menu: MenuRows.allCases[indexPath.row], languageString: languages[selectedIndex  ])
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
        languageView.configure(languages: languages, selectedIndex: selectedIndex)
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            languageView.heightConstraint.constant = CGFloat(self.languages.count) * 30
            languageView.layoutIfNeeded()
        }

        languageView.onSelectedIndex = { [weak self] index in
//            guard let self = self else { return }
            let indexPath = IndexPath(row: MenuRows.language.rawValue, section: 0)
            self?.selectedIndex = index
            self?.presenter?.selectLanguage(index: index)
            self?.tableView.reloadRows(at: [indexPath], with: .none)
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
    func showView(superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(self)
        let widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 1, constant: 0)

        leadingConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1, constant: superview.frame.width)
        topConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: -superview.frame.height)

        superview.addConstraints([widthConstraint, heightConstraint, leadingConstraint!, topConstraint!])
        layoutIfNeeded()
        superview.layoutIfNeeded()
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.leadingConstraint?.constant = 0
            self?.topConstraint?.constant = 0
            self?.layoutIfNeeded()
            self?.superview?.layoutIfNeeded()
        }
    }

    func closeView() {
        guard let superview = superview else { return }
        UIView.animate(withDuration: 0.4, animations: { [weak self] in
            self?.leadingConstraint?.constant = superview.frame.width
            self?.topConstraint?.constant = -superview.frame.height
            self?.superview?.layoutIfNeeded()
            self?.layoutIfNeeded()
        }, completion: { [weak self] _ in
            self?.removeFromSuperview()
        })
    }

    func languageList(languages: [String], selectedIndex: Int) {
        self.languages = languages
        self.selectedIndex = selectedIndex
    }
}
