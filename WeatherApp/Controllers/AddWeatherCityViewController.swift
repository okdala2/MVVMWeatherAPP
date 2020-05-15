//
//  AddWeatherCityViewController.swift
//  WeatherApp
//
//  Created by Dala  on 5/14/20.
//  Copyright © 2020 Dala . All rights reserved.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed(_ sender: Any) {
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=d8af6e368c96192c3d51074567e23941")!
            
            let weatherResource = Resource<WeatherViewModel> (url: weatherURL) { data in
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            Webservice().load(resource: weatherResource) { [weak self] result in
                
                if let weatherVM = result {
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}
