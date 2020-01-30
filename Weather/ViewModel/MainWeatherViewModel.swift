import Foundation

class MainWeatherViewModel: MainWeatherViewModelType {
    
    var weatherData = WeatherData()
   
    var weatherImg: String {
        return weatherData.weather.last!.icon
    }
    
    var cityAndCountryLabel: String {
        return weatherData.name
    }
    
    var tempAndDescLabel: String {
        return "\(Int(weatherData.main.temp))℃ | \(weatherData.weather.last!.description)"
    }
    
    var speed: String {
        return weatherData.wind.speed.description
      }
    
    var deg: Int {
        return weatherData.wind.deg
    }
    
    var pressure: Int {
        return weatherData.main.pressure
    }
    
    var humidity: Int {
        return weatherData.main.humidity
    }

    
    
    
    func updateWeatherInfo(latitude: Double, longitude: Double, handler: @escaping(_ weatherData: WeatherData?, _ error: Error?)->()) {
        let session = URLSession.shared
           guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longitude.description)&units=metric&lang=en&APPID=586f233f5b8a6bf6b1252b568666e2ba") else {
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
