import Foundation

protocol ForecastWeatherViewModelType: class {
    func numberOfRows() -> Int
    func updateWeatherInfo(latitude: Double, longtitude: Double, handler: @escaping(_ weatherData: WeatherFinalForecast?, _ error: Error?)->())
    func cellViewModel(forIndexPath indexPath: IndexPath) -> ForecastWeatherCellViewModelType?
}
