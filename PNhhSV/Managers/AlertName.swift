//
//  AlertName.swift
//  PNhhSV
//
//  Created by REYNIKOV ANTON on 02/11/2019.
//  Copyright © 2019 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class AlertName {
    
    func alertName(viewController: UIViewController, viewModel: ViewModel, tableView: UITableView) {
        DispatchQueue.main.async {
            let dialogWindow = UIAlertController(title: "Поиск вакансии", message: "", preferredStyle: UIAlertController.Style.alert)
            dialogWindow.addTextField { (UITextField) in
            }
            dialogWindow.addAction(UIAlertAction(title: "Искать", style: .default, handler: { (UIAlertAction) in
                viewModel.sendTokenDivece.sendTokenDevice(viewModel: viewModel)
                viewModel.id = []
                let name = dialogWindow.textFields![0] as UITextField
                let stringName = name.text!
                let arrNameOriginal = stringName.components(separatedBy: .whitespaces)
                viewModel.nameArray = arrNameOriginal.filter({$0 != ""})
                let arrName = stringName.components(separatedBy: .whitespaces)
                let stringNameNotWhiteSpaces = arrName.joined()
                viewModel.name = stringNameNotWhiteSpaces
                viewModel.sendName.sendName(viewModel: viewModel)
                viewModel.sendNameArray.sendNameArray(viewModel: viewModel)
                viewModel.getAndReload.getAndReload(viewModel: viewModel, tableView: tableView, viewController: viewController)
            }))
            viewController.present(dialogWindow, animated: true, completion: nil)
        }
    }
}

