//
//  SendName.swift
//  PNhhSV
//
//  Created by REYNIKOV ANTON on 04.11.2019.
//  Copyright © 2019 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class SendName {
    
    func sendName(viewModel: ViewModel) {
        guard let url = URL(string: ("http://133.133.133.133:8000/hh/5dc07f8a191ea01605298d4c")) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let bodyData = "name=\(viewModel.name)"
        request.httpBody = bodyData.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        }
        task.resume()
    }
}




