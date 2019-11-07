//
//  LabelAndButton.swift
//  PNhhSV
//
//  Created by REYNIKOV ANTON on 03.11.2019.
//  Copyright © 2019 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class LabelAndButton {
    
    func addLabelAndButton(tableView: UITableView, viewModel: ViewModel, section: Int, action: Selector, viewController: UIViewController) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let button = UIButton()
        let label = UILabel()
        button.frame = CGRect.init(x: headerView.frame.width - headerView.frame.width / 5, y: 0, width: headerView.frame.width / 5, height: headerView.frame.height)
        button.tag = section
        button.addTarget(viewController, action: action, for: .touchUpInside)
        label.frame = CGRect.init(x: 15, y: 0, width: ((headerView.frame.width * 4) / 5) - 15, height: headerView.frame.height)
        label.text = viewModel.name
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.white
        button.setTitle("Cброс", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        headerView.backgroundColor = UIColor.red
        headerView.addSubview(button)
        headerView.addSubview(label)
        return headerView
    }
}
