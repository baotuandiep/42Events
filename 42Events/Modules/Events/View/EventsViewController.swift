//
//  EventsViewController.swift
//  42Events
//
//  Created by Tuan Diep on 5/29/21.
//  Copyright © 2021 Tuan Diep. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    var presenter: EventsViewToPresenterProtocol?
    var datas: [EventModel] = []


    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadData()
        tableView.registerFromNib(forCellClass: EventsTableViewCell.self)
    }

}

extension EventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: EventsTableViewCell.self, for: indexPath)
        cell.configureData(data: datas[indexPath.row])
        return cell
    }
}

extension EventsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }
}

extension EventsViewController: EventsPresenterToViewProtocol {
    func receiveData(datas: [EventModel]) {
        self.datas = datas
        tableView.reloadData()
    }
}
