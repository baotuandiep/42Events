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
}

// MARK: - View Controller Lifecycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Event"
        presentor?.loadData()
    }
}

extension HomeViewController: HomePresenterToViewProtocol {

}
