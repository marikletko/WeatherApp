//
//  MainWeatherViewController.swift
//  Weather
//
//  Created by Kirill Letko on 1/29/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import UIKit

class MainWeatherViewController: UIViewController {

    @IBOutlet var weatherImg: UIImageView!
    @IBOutlet var cityAndCountryLabel: UILabel!
    @IBOutlet var tempAndDescLabel: UILabel!
    
    var mainWeatherViewModel:MainWeatherViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainWeatherViewModel = MainWeatherViewModel()
        guard let lastLocation = LocationService.sharedInstance.currentLocation else { return }
        mainWeatherViewModel?.updateWeatherInfo(latitude: (lastLocation.coordinate.latitude), longtitude: (lastLocation.coordinate.longitude), handler: {(weatherData, error) in
                       DispatchQueue.main.async {
                        
                          // obj.currentTemp.text = String(Int(((weatherData?.main.temp)!))) + " ℃"
                           self.weatherImg.image = UIImage(named:(weatherData?.weather.last!.icon)!)
                          // self.currentTemp.text = String(Int(((weatherData?.main.temp)!))) + " ℃"
                      // self.weatherDescription.text = weatherData?.weather.last?.description
                       }
    })
        
    }
    
    @IBAction func shareWeatherButton(_ sender: UIButton) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
