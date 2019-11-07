//
//  GetReq.swift
//  PNhhSV
//
//  Created by REYNIKOV ANTON on 01/11/2019.
//  Copyright © 2019 REYNIKOV ANTON. All rights reserved.
//

import Foundation

struct  Item: Codable {
    var items: [NameAndEmpolyer]
}
struct NameAndEmpolyer: Codable {
    var id: String
    var name: String
    var employer: Empolyer
    var alternate_url: String
}
struct Empolyer: Codable {
    var name: String
}

