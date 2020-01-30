//
//  ForecastWeatherCellViewModel.swift
//  Weather
//
//  Created by Kirill Letko on 1/30/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import Foundation

class ForecastWeatherCellViewModel: ForecastWeatherCellViewModelType {
    
    private var forecastcell : WeatherDataForecast
    
    var foreImage: String {
        return (forecastcell.weather.last?.icon)!
    }
    var descLabel: String {
        return (forecastcell.weather.last!.description)
    }
    var tempLabel: String {
        return String(Int(forecastcell.main.temp)) + " ℃"
    }
    var time: String {
        return forecastcell.dt_txt
    }
    
    
    init(cell: WeatherDataForecast) {
          self.forecastcell = cell
      }
    
}
