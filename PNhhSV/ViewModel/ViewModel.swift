//
//  ViewModel.swift
//  PNhhSV
//
//  Created by REYNIKOV ANTON on 01/11/2019.
//  Copyright © 2019 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class ViewModel {
    
    var nameAndEmpolyer: [NameAndEmpolyer]?
    var getAndReload = GetAndReload()
    var request = NetMan()
    var alertName = AlertName()
    var addLabelAndButton = LabelAndButton()
    var sendTokenDivece = SendTokenDevice()
    var sendName = SendName()
    var sendNameArray = SendNameArray()
    var sendId = SendId()
    var nameArray: [String] {
        get {
            return UserDefaults.standard.array(forKey: "nameArray") as! [String]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "nameArray")
        }
    }
    private var _id = [String]()
    var id: [String] {
        get {
            return _id
        }
        set {
            _id = newValue
        }
    }
    var tokenDevice: String {
        get {
            return UserDefaults.standard.string(forKey: "tokenDevice") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "tokenDevice")
        }
    }
    var name: String {
        get {
            return UserDefaults.standard.string(forKey: "name") ?? "Начни поиск..."
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "name")
        }
    }
    var cutArray = CutArray()
    func numberOfRows() -> Int {
        return nameAndEmpolyer?.count ?? 0
    }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModel? {
        return TableViewCellViewModel(nameAndEmpolyer: nameAndEmpolyer![indexPath.row])
    }
    func alertNameAndRequest(viewModel: ViewModel, tableView: UITableView, viewController: UIViewController) {
        if name != "Начни поиск..." {
            getAndReload.getAndReload(viewModel: viewModel, tableView: tableView, viewController: viewController)
        } else {
            alertName.alertName(viewController: viewController, viewModel: viewModel, tableView: tableView)
        }
    }
    func reset(viewModel: ViewModel, tableView: UITableView, viewController: UIViewController) {
        viewModel.name = "Начни поиск..."
        viewModel.alertNameAndRequest(viewModel: viewModel, tableView: tableView, viewController: viewController)
    }
    func cellRow(tableView: UITableView, viewModel: ViewModel, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        guard let tableViewCell = cell else { return UITableViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.textLabel?.text = cellViewModel?.nameEmpolyer
        tableViewCell.detailTextLabel?.text = cellViewModel?.name
        return tableViewCell
    }
    func selectRow(atIndexPath indexPath: IndexPath, viewModel: ViewModel) {
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        let urlAddress = cellViewModel?.nameAndEmpolyer.alternate_url
        guard let url = URL(string: urlAddress ?? "https://hh.ru") else { return }
        UIApplication.shared.open(url)
    }
}

