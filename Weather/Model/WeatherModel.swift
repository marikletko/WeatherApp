import Foundation

struct Weather: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Decodable {
    var temp: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
}

struct Wind: Decodable {
    var speed: Double = 0.0
    var deg: Int = 0
}


struct WeatherData: Decodable {
    var weather: [Weather] = []
    var main: Main = Main()
    var wind: Wind = Wind()
    var name: String = ""
}
