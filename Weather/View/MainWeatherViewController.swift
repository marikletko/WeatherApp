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
    
    @IBOutlet var weatherIcons: [UIView]!
    
    var mainWeatherViewModel:MainWeatherViewModelType?
    var locationManager: LocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationsHandler()
        mainWeatherViewModel = MainWeatherViewModel()
        locationManager = LocationManager(locationResponse: {[weak self] (newLocation) in
            self?.mainWeatherViewModel?.updateWeatherInfo(latitude: newLocation.coordinate.latitude, longtitude: newLocation.coordinate.longitude, handler: {(weatherData, error) in
                DispatchQueue.main.async {
                    
                    for (index, item) in (self?.weatherIcons.enumerated())! {
                        let obj = WeatherIconsMain()
                        let view = obj.instanceFromNin()
                        switch index {
                        case 0:
                            view.iconText = self?.mainWeatherViewModel?.humidity.description
                            view.icon = "humidity"
                            
                        case 1:
                            view.iconText = "0.6"
                            view.icon = "kaplya"
                            
                        case 2:
                            view.iconText = self?.mainWeatherViewModel?.pressure.description
                            view.icon = "pressure"
                            
                        case 3:
                            view.iconText = self?.mainWeatherViewModel?.speed
                            view.icon = "wind"
                            
                        case 4:
                            view.iconText = self?.mainWeatherViewModel?.deg.description
                            view.icon = "compass"
                        default:
                            break
                        }
                        item.addSubview(view)
                    }
                    
                    self?.weatherImg.image = UIImage(named:(self?.mainWeatherViewModel!.weatherImg)!)
                    self?.cityAndCountryLabel.text = self?.mainWeatherViewModel?.cityAndCountryLabel
                    self?.tempAndDescLabel.text = self?.mainWeatherViewModel?.tempAndDescLabel
                }
            })
            
        })
        
    }
    
    
    @objc func applicationDidBecomeActive(notification: Notification) {
        locationManager?.requestLocation()
    }
    
    private func notificationsHandler() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(applicationDidBecomeActive(notification:)), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    @IBAction func shareWeatherButton(_ sender: UIButton) {
        let text = "This is the text....."
            let textShare = [ text ]
            let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
    }
    
    
}
