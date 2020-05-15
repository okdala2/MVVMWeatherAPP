//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Dala  on 5/13/20.
//  Copyright © 2020 Dala . All rights reserved.
//

import Foundation

//This is the top view model
//Not only the tableview but the whole screen (ie. add a search bar / segments bar / fiters)

struct WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel) {
        self.weatherViewModels.append(vm)
        
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
        
    }
}

struct WeatherViewModel: Decodable {
    let name: String
    let currentTemperature: TemperatureViewModel
    
    private enum codingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel: Decodable {
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey {
        
        case temperature = "temp"
        case temperatureMax = "temp_man"
        case temperatureMin = "temp_min"
    }
}
