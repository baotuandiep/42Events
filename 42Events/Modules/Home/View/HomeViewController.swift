//
//  HomeViewController.swift
//  42Events
//
//  Created by Tuan Diep on 5/27/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

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
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data == nil ? 0 : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else { return UITableViewCell() }
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(type: FeatureTableViewCell.self, for: indexPath)
            cell.setData(datas: data.featured)
            return cell
        }
        return UITableViewCell()
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
