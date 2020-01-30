import Foundation


class ForecastWeatherViewModel: ForecastWeatherViewModelType {
  
    func cellViewModel(forIndexPath indexPath: IndexPath) -> ForecastWeatherCellViewModelType? {
        let weather = weeklyWeather.list[indexPath.row]
        return ForecastWeatherCellViewModel(cell: weather)
    }
    
    var weeklyWeather = WeatherFinalForecast()


    
    func numberOfRows() -> Int {
        return weeklyWeather.list.count
    }


func updateWeatherInfo(latitude: Double, longtitude: Double, handler: @escaping(_ weatherData: WeatherFinalForecast?, _ error: Error?)->()) {
      let session = URLSession.shared
         guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude.description)&lon=\(longtitude.description)&units=metric&lang=en&APPID=586f233f5b8a6bf6b1252b568666e2ba") else {
             return
         }
         let task = session.dataTask(with: url) { (data, response, error) in
             guard error == nil else {
                 print("\(error!.localizedDescription)")
                 return
             }
             
             do {
                self.weeklyWeather = try JSONDecoder().decode(WeatherFinalForecast.self, from: data!)
                handler(self.weeklyWeather, nil)
             } catch let error{
                 handler(nil, error)
         }
         }
         task.resume()
  }


}
