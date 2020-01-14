//
//  SendId.swift
//  PNhhSV
//
//  Created by REYNIKOV ANTON on 05.11.2019.
//  Copyright © 2019 REYNIKOV ANTON. All rights reserved.
//

import UIKit


class SendId {
    
    func sendId(viewModel: ViewModel) {
        guard let url = URL(string: ("http://133.133.133.133:8000/hh/5dc197b3c3f9d606c5609124")) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        if viewModel.id.count != 0 {
            let bodyData = "id=\(viewModel.id)"
            request.httpBody = bodyData.data(using: .utf8)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            }
            task.resume()
        }
    }
}
