//
//  JsonFromURL.swift
//  Landmark
//
//  Created by Hoang Viet on 20/11/2020.
//  Copyright © 2020 Hoang Viet. All rights reserved.
//

import UIKit

    func getWeather( urlString: String, completion: @escaping([Weather]) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (Data, Response, Error) in
            let weatherdata = try! JSONDecoder().decode([Weather].self, from: Data!)
            
            DispatchQueue.main.async {
                completion(weatherdata)
            }
        }.resume()
    }
