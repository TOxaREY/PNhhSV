//
//  SendNameArray.swift
//  PNhhSV
//
//  Created by REYNIKOV ANTON on 05.11.2019.
//  Copyright © 2019 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class SendNameArray {
    
    func sendNameArray(viewModel: ViewModel) {
        guard let url = URL(string: ("http://133.133.133.133:8000/hh/5dc07f91191ea01605298d4d")) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let bodyData = "nameArray=\(viewModel.nameArray)"
        request.httpBody = bodyData.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        }
        task.resume()
    }
}
