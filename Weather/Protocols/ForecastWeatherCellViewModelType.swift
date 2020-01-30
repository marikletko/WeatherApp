import Foundation

protocol ForecastWeatherCellViewModelType: class {
    var foreImage: String { get }
    var descLabel: String { get }
    var tempLabel: String { get }
    var time: String { get }
}

