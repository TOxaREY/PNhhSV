//
//  GetAndReload.swift
//  PNhhSV
//
//  Created by REYNIKOV ANTON on 01/11/2019.
//  Copyright © 2019 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class GetAndReload {
    func getAndReload(viewModel: ViewModel, tableView: UITableView, viewController: UIViewController ) {
        if TestConnection.isConnectedToNetwork() {
            viewModel.request.request(name: viewModel.name) { (nameAndEmpolyer) in
                viewModel.nameAndEmpolyer = ((nameAndEmpolyer) as! [NameAndEmpolyer])
                viewModel.nameAndEmpolyer = viewModel.cutArray.cutArray(arrayName: viewModel.nameArray, arrayFull: viewModel.nameAndEmpolyer!, viewModel: viewModel)
                viewModel.sendId.sendId(viewModel: viewModel)
                if viewModel.nameAndEmpolyer?.count == 0 {
                    viewModel.reset(viewModel: viewModel, tableView: tableView, viewController: viewController)
                }
                DispatchQueue.main.async {
                    tableView.reloadData()
                    if viewModel.name != "Начни поиск..." {
                        let indexPath = IndexPath(row: 0, section: 0)
                        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                    }
                }
            }
        } else {
            viewModel.name = "Интернет недоступен"
            DispatchQueue.main.async {
                viewModel.nameAndEmpolyer?.removeAll()
                tableView.reloadData()
            }
        }
    }
}
