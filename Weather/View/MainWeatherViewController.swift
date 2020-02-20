import UIKit
import CoreLocation

class MainWeatherViewController: UIViewController {
    
    @IBOutlet var weatherImg: UIImageView!
    @IBOutlet var cityAndCountryLabel: UILabel!
    @IBOutlet var tempAndDescLabel: UILabel!
    @IBOutlet var activity: UIActivityIndicatorView!
    @IBOutlet var activityBlur: UIVisualEffectView!
    
    @IBOutlet var weatherIcons: [UIView]!
    
    var mainWeatherViewModel:MainWeatherViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainWeatherViewModel = MainWeatherViewModel()
        
        
        LocationManager.sharedInstance.getLocation { (location:CLLocation?, error:NSError?) in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            self.mainWeatherViewModel?.updateWeatherInfo(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, handler: {(weatherData, error) in
                DispatchQueue.main.async {
                    
                    for (index, item) in (self.weatherIcons.enumerated()) {
                        let obj = WeatherIconsMain()
                        let view = obj.instanceFromNin()
                        switch index {
                        case 0:
                            
                            view.iconText = self.mainWeatherViewModel?.humidity.description
                            view.icon = "humidity"
                            
                        case 1:
                            view.iconText = "0.6" // Не нашел в JSON'e такого значения
                            view.icon = "mm"
                            
                        case 2:
                            view.iconText = self.mainWeatherViewModel?.pressure.description
                            view.icon = "pressure"
                            
                        case 3:
                            view.iconText = self.mainWeatherViewModel?.speed
                            view.icon = "wind"
                            
                        case 4:
                            view.iconText = self.mainWeatherViewModel?.deg.description
                            view.icon = "compass"
                        default:
                            break
                        }
                        item.addSubview(view)
                    }
                    
                    self.weatherImg.image = UIImage(named:(self.mainWeatherViewModel!.weatherImg))
                    self.cityAndCountryLabel.text = self.mainWeatherViewModel?.cityAndCountryLabel
                    self.tempAndDescLabel.text = self.mainWeatherViewModel?.tempAndDescLabel
                    self.activity.isHidden = true
                    self.activityBlur.isHidden = true
                    
                    let shareText =
                    "Pressure: \(self.mainWeatherViewModel!.pressure)" +
                    "\nWind speed:\(self.mainWeatherViewModel!.speed)" +
                    "\nHumidity: \(self.mainWeatherViewModel!.humidity)" +
                    "\nCity: \(self.mainWeatherViewModel!.cityAndCountryLabel)" +
                    "\n\(self.mainWeatherViewModel!.tempAndDescLabel)"
                    UserDefaults.standard.set(shareText, forKey: "shareText")
                        
                }
            })
            
            
        }
        
    }
    
    @IBAction func shareWeatherButton(_ sender: UIButton) {
        let text = UserDefaults.standard.value(forKey: "shareText")
                let textShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textShare as [Any] , applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view
                self.present(activityViewController, animated: true, completion: nil)
    }
    
    
}
