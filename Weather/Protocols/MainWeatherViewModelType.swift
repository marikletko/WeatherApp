//
//  MainWeatherViewModelType.swift
//  Weather
//
//  Created by Kirill Letko on 1/29/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import Foundation

protocol MainWeatherViewModelType: class {
    
    var weatherImg: String { get }
    var cityAndCountryLabel: String { get }
    var tempAndDescLabel: String { get }
    var speed: String { get }
    var deg: Int { get }
    var pressure: Int { get }
    var humidity: Int { get }
    
     func updateWeatherInfo(latitude: Double, longtitude: Double, handler: @escaping(_ weatherData: WeatherData?, _ error: Error?)->())
    
    
    
}
