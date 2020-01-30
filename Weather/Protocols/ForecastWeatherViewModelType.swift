//
//  ForecastWeatherViewModelType.swift
//  Weather
//
//  Created by Kirill Letko on 1/30/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import Foundation


protocol ForecastWeatherViewModelType: class {

     func numberOfRows() -> Int
     func updateWeatherInfo(latitude: Double, longtitude: Double, handler: @escaping(_ weatherData: WeatherFinalForecast?, _ error: Error?)->())
    func cellViewModel(forIndexPath indexPath: IndexPath) -> ForecastWeatherCellViewModelType?
    
    
    
}
