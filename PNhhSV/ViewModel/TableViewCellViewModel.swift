//
//  TableViewCellViewModel.swift
//  PNhhSV
//
//  Created by REYNIKOV ANTON on 01/11/2019.
//  Copyright © 2019 REYNIKOV ANTON. All rights reserved.
//

import Foundation

class TableViewCellViewModel {
    
    var nameAndEmpolyer: NameAndEmpolyer

    var name: String {
        return nameAndEmpolyer.name
    }
    var nameEmpolyer: String {
        return nameAndEmpolyer.employer.name
    }
    init(nameAndEmpolyer: NameAndEmpolyer) {
        self.nameAndEmpolyer = nameAndEmpolyer
    }
}
