//
//  WebService.swift
//  WeatherApp
//
//  Created by Dala  on 5/13/20.
//  Copyright © 2020 Dala . All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservice {
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            print(data)
            
            if let data = data {
                DispatchQueue.main.async {
                    // Want to fire completion on the main thread (load function gets called on the view controller)
                    // We don't want issues with updating the UI / Tableview
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
            
        }.resume()
    }
}
