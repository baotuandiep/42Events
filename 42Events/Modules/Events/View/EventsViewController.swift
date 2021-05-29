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
        // Do any additional setup after loading the view.
    }

}

extension EventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension EventsViewController: EventsPresenterToViewProtocol {
    func receiveData(datas: [EventModel]) {
        self.datas = datas
    }
}
