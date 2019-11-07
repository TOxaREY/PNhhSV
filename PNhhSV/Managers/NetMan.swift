//
//  NetMan.swift
//  PHhhSV
//
//  Created by REYNIKOV ANTON on 01/11/2019.
//  Copyright © 2019 REYNIKOV ANTON. All rights reserved.
//

import Foundation

class NetMan {
    
    func request(name: String, resp: @escaping ([NameAndEmpolyer?]) -> Void)  {
        guard let url = URL(string: ("https://api.hh.ru/vacancies?text=" + name + "&area=1&page=0&per_page=100").addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!) else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["User-Agent" : "api-test-agent"]
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let items =  try decoder.decode(Item.self, from: data)
                resp(items.items)
            } catch let jsonError {
                print(jsonError)
            }
        }
        task.resume()
    }
}



