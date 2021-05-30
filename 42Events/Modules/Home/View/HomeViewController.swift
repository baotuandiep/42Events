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

    var headerTitle: String? {
        switch self {
        case .feature:
            return nil
        case .events:
            return "Events"
        case .startingSoon:
            return "Starting soon"
        case .popular:
            return "Popular"
        case .newRelease:
            return "New Release"
        case .free:
            return "Free"
        case .past:
            return "Past Events"
        }
    }
}

class HomeViewController: UIViewController {

    var presenter: HomeViewToPresenterProtocol?

    @IBOutlet weak var tableView: UITableView!
    var data: HomeDataModel?
    var contentXOffset: [Int: CGFloat] = [:]
}

// MARK: - View Controller Lifecycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Events"
        presenter?.loadData()
        tableView.registerFromNib(forCellClass: FeatureTableViewCell.self)
        tableView.registerFromNib(forCellClass: NormalTableViewCell.self)
        tableView.registerFromNib(forCellClass: EventContainerTableViewCell.self)


        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .label
        navigationItem.rightBarButtonItem = rightItem
    }

    @objc func rightItemTapped() {
        presenter?.showMenu(view: view)
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
        case .events:
            let cell = tableView.dequeueReusableCell(type: EventContainerTableViewCell.self, for: indexPath)
            cell.touchedOnEvent = { [weak self] eventType in
                guard let navigationController = self?.navigationController else { return }
                self?.presenter?.touchedOnEvent(navigationController: navigationController, eventType: eventType)
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(type: NormalTableViewCell.self, for: indexPath)
            cell.updateTargetPoint = { [weak self] in
                guard let indexPath = tableView.indexPath(for: $0) else { return }
                self?.contentXOffset[indexPath.section] = $1.x
            }
            cell.collectionView.contentOffset.x = contentXOffset[indexPath.section] ?? -cell.customLayout.paddingLeft
            switch HomeSection.allCases[indexPath.section] {
            case .startingSoon:
                cell.setData(datas: data.startingSoon)
            case .popular:
                cell.setData(datas: data.popular)
            case .newRelease:
                cell.setData(datas: data.newRelease)
            case .free:
                cell.setData(datas: data.free)
            case .past:
                cell.setData(datas: data.past)
            default:
                break
            }
            return cell
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let title = HomeSection.allCases[section].headerTitle else { return nil }
        let view = HomeHeaderView.instantiate()
        view.titleLabel.text = title
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        HomeSection.allCases[section].headerTitle == nil ? 0 : 50
    }
}

extension HomeViewController: HomePresenterToViewProtocol {
    func receiveData(data: HomeDataModel) {
        guard self.data == nil else { return }
        self.data = data
        tableView.reloadData()
    }
}
