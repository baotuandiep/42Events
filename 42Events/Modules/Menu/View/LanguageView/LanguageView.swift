//
//  LanguageView.swift
//  42Events
//
//  Created by Tuan Diep on 5/30/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class LanguageView: UIView {

    static func instantiate() -> LanguageView {
        UINib(nibName: "LanguageView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? LanguageView ?? LanguageView()
    }

    @IBOutlet weak var leadingTableViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    var close: (() -> Void)?
    var onSelectedIndex: ((Int) -> Void)?

    var languages: [String] = []
    var selectedIndex: Int = 0

    override func awakeFromNib() {
        superview?.awakeFromNib()
        tableView.registerFromNib(forCellClass: LanguageTableViewCell.self)
        tableView.layer.cornerRadius = 5
        tableView.layer.borderColor = UIColor.gray.cgColor
        tableView.layer.borderWidth = 1
    }

    func configure(languages: [String], selectedIndex: Int) {
        self.languages = languages
        self.selectedIndex = selectedIndex
        tableView.reloadData()
    }

    @IBAction func closeViewTouched(_ sender: UIButton) {
        close?()
    }
}

extension LanguageView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: LanguageTableViewCell.self, for: indexPath)
        cell.languageLabel?.text = languages[indexPath.row]
        cell.setSelected(indexPath.row == selectedIndex, animated: false)
        return cell
    }
}

extension LanguageView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        30
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        onSelectedIndex?(selectedIndex)
        close?()
    }
}
