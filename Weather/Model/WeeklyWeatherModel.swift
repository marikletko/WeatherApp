//
//  WeeklyWeatherModel.swift
//  Weather
//
//  Created by Kirill Letko on 1/29/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import Foundation


struct WeatherForecast: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct MainForecast: Decodable {
    var temp: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
}

struct WindForecast: Decodable {
    var speed: Double = 0.0
    var deg: Int = 0
}


struct WeatherDataForecast: Decodable {
    var weather: [WeatherForecast] = []
    var main: MainForecast = MainForecast()
    var wind: WindForecast = WindForecast()
    var dt_txt: String
}

struct WeatherFinalForecast: Decodable {
    var list:[WeatherDataForecast] = []
}
