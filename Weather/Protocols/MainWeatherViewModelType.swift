//
//  MainWeatherViewModelType.swift
//  Weather
//
//  Created by Kirill Letko on 1/29/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import Foundation

protocol MainWeatherViewModelType {
     func updateWeatherInfo(latitude: Double, longtitude: Double, handler: @escaping(_ weatherData: WeatherData?, _ error: Error?)->())
}
