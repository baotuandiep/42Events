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

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var loadingView: UIView!
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

    @IBAction func retryButtonTouched(_ sender: UIButton) {
        presenter?.loadData()
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
                self.reloadCurrentView()
            }
            return view
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }

    func reloadCurrentView() {
        let visibleCells: [UITableViewCell] = tableView.visibleCells
        var indexPaths: [IndexPath] = []
        var maxIndex = 0
        var minIndex = datas.count - 1
        visibleCells.forEach {
            if let indexPath = tableView.indexPath(for: $0) {
                indexPaths.append(indexPath)
                maxIndex = max(indexPath.row, maxIndex)
                minIndex = min(indexPath.row, minIndex)
            }
        }
        var currentCountUp = 0
        // reload 2 more index in bottom
        while currentCountUp < 2 && maxIndex < datas.count {
            currentCountUp += 1
            indexPaths.append(IndexPath(row: maxIndex, section: 0))
            maxIndex += 1
        }
        // reload 2 more index in top
        currentCountUp = 0
        while currentCountUp < 2 && minIndex >= 0 {
            currentCountUp += 1
            indexPaths.append(IndexPath(row: minIndex, section: 0))
            minIndex -= 1
        }

        tableView.reloadRows(at: indexPaths, with: .automatic)
    }
}

extension EventsViewController: EventsPresenterToViewProtocol {
    func showErrorView(errorString: String) {
        errorView.isHidden = false
        loadingView.isHidden = true
        errorLabel.text = errorString
    }

    func showLoadingView() {
        errorView.isHidden = true
        loadingView.isHidden = false
    }

    func receiveData(datas: [EventModel]) {
        loadingView.isHidden = true
        self.datas = datas
        tableView.reloadData()
    }
}
