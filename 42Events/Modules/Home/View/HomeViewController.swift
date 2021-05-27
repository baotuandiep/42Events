//
//  HomeViewController.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

enum HomeSection: Int, CaseIterable {
    case feature
    case events
    case startingSoon
    case popular
    case newRelease
    case free
    case past
}

class HomeViewController: UIViewController {

    var presentor: HomeViewToPresenterProtocol?

    @IBOutlet weak var tableView: UITableView!
    var data: HomeDataModel?
}

// MARK: - View Controller Lifecycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Event"
        presentor?.loadData()
        tableView.registerFromNib(forCellClass: FeatureTableViewCell.self)
        tableView.registerFromNib(forCellClass: NormalTableViewCell.self)
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        data == nil ? 0 : HomeSection.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data == nil ? 0 : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else { return UITableViewCell() }
        switch HomeSection.allCases[indexPath.section] {
        case .feature:
            let cell = tableView.dequeueReusableCell(type: FeatureTableViewCell.self, for: indexPath)
            cell.setData(datas: data.featured)
            return cell
        case .startingSoon:
            let cell = tableView.dequeueReusableCell(type: NormalTableViewCell.self, for: indexPath)
            cell.setData(datas: data.startingSoon)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension HomeViewController: HomePresenterToViewProtocol {
    func receiveData(data: HomeDataModel) {
        guard self.data == nil else { return }
        self.data = data
        tableView.reloadData()
    }
}
