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
    var header: EventsHeaderView?
    var isShowMedal = false

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadData()
        tableView.registerFromNib(forCellClass: EventsTableViewCell.self)

        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .label
        navigationItem.rightBarButtonItem = rightItem
    }

    @objc func rightItemTapped() {
        MenuRouter.createModule(on: self.view)
    }

}

extension EventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: EventsTableViewCell.self, for: indexPath)
        cell.configureData(data: datas[indexPath.row], isShowMedal: isShowMedal)
        return cell
    }
}

extension EventsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = header {
            header.titleLabel.text = "\(datas.count) events"
            return header
        } else {
            let view = EventsHeaderView.instantiate()
            header = view
            view.titleLabel.text = "\(datas.count) events"
            view.switchChangeValue = { [weak self] in
                guard let self = self else { return }
                self.isShowMedal = $0
                self.presenter?.isShowMedalChangedValue(isShowMedal: $0, tableView: self.tableView)
            }
            return view
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}

extension EventsViewController: EventsPresenterToViewProtocol {
    func receiveData(datas: [EventModel]) {
        self.datas = datas
        tableView.reloadData()
    }
}
