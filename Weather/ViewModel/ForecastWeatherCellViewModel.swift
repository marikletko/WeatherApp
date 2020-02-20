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
        return String(String(forecastcell.dt_txt.dropFirst(11)).dropLast(3))
    }
    
    
    init(cell: WeatherDataForecast) {
          self.forecastcell = cell
      }
    
}
