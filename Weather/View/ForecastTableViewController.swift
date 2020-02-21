import UIKit
import CoreLocation

class ForecastTableViewController: UITableViewController {
    let reuseIdentifier = "cell"
    var forecastWeatherViewModel:ForecastWeatherViewModelType?
    var locationManager: LocationManager?
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionHeaderHeight = 70
 forecastWeatherViewModel = ForecastWeatherViewModel()
   
        
        LocationManager.sharedInstance.getLocation { (location:CLLocation?, error:NSError?) in
                  if error != nil {
                      print(error!.localizedDescription)
                      return
                  }
        
            self.forecastWeatherViewModel?.updateWeatherInfo(latitude: (location?.coordinate.latitude)!, longtitude: (location?.coordinate.longitude)!, handler: {(weatherData, error) in
                      DispatchQueue.main.async {
                        self.tableView.reloadData()
                      }
                  })

        }
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ((self.forecastWeatherViewModel?.numberOfRows())!)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ForecastTableViewCell
              
          guard let tableViewCell = cell, let viewModel = forecastWeatherViewModel else { return UITableViewCell() }
           
           let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)

        tableViewCell.viewModel = cellViewModel

           return tableViewCell
    }


}
