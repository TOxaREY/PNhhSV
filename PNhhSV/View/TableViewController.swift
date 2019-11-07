//
//  TableViewController.swift
//  PNhhSV
//
//  Created by REYNIKOV ANTON on 01/11/2019.
//  Copyright © 2019 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var viewModel = ViewModel()
    
    @objc func reset() {
        viewModel.reset(viewModel: viewModel, tableView: tableView, viewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reset), name: NSNotification.Name(rawValue: "reset"), object: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        viewModel.alertNameAndRequest(viewModel: viewModel, tableView: tableView, viewController: self)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.cellRow(tableView: tableView, viewModel: viewModel, indexPath: indexPath)
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        viewModel.addLabelAndButton.addLabelAndButton(tableView: tableView, viewModel: viewModel, section: section, action: #selector(reset), viewController: self)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectRow(atIndexPath: indexPath, viewModel: viewModel)
    }
}
