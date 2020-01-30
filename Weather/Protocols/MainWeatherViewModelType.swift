import Foundation
import CoreLocation

protocol MainWeatherViewModelType: class {
    
    var weatherImg: String { get }
    var cityAndCountryLabel: String { get }
    var tempAndDescLabel: String { get }
    var speed: String { get }
    var deg: Int { get }
    var pressure: Int { get }
    var humidity: Int { get }
    
    func updateWeatherInfo(latitude: Double, longitude: Double, handler: @escaping(_ weatherData: WeatherData?, _ error: Error?)->())
    
    
    
}
