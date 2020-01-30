//
//  ForecastWeatherCellViewModelType.swift
//  Weather
//
//  Created by Kirill Letko on 1/30/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import Foundation


protocol ForecastWeatherCellViewModelType: class {
var foreImage: String { get }
   var descLabel: String {
      get
   }
   var tempLabel: String {
       get
   }
    
    var time: String {
    get
    }
}

