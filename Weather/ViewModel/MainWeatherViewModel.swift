//
//  MainWeatherViewModel.swift
//  Weather
//
//  Created by Kirill Letko on 1/29/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import Foundation

class MainWeatherViewModel: MainWeatherViewModelType {
    
    var weatherData = WeatherData()
    
    func updateWeatherInfo(latitude: Double, longtitude: Double, handler: @escaping(_ weatherData: WeatherData?, _ error: Error?)->()) {
        let session = URLSession.shared
           guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longtitude.description)&units=metric&lang=en&APPID=586f233f5b8a6bf6b1252b568666e2ba") else {
               return
           }
           let task = session.dataTask(with: url) { (data, response, error) in
               guard error == nil else {
                   print("\(error!.localizedDescription)")
                   return
               }
               
               do {
                   self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                   handler(self.weatherData, nil)
               } catch let error{
                   handler(nil, error)
           }
           }
           task.resume()
    }
    
}
