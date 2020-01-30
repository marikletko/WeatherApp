//
//  ForecastTableViewController.swift
//  Weather
//
//  Created by Kirill Letko on 1/29/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import UIKit

class ForecastTableViewController: UITableViewController {

    var x:[String] = ["1", "2", "3" ,"4" ,"5", "6","7","8"]
    
     var forecastWeatherViewModel:ForecastWeatherViewModelType?
    var locationManager: LocationManager?
    override func viewDidLoad() {
        super.viewDidLoad()
         notificationsHandler()
 forecastWeatherViewModel = ForecastWeatherViewModel()
      //  locationManager = LocationManager(locationResponse: {[weak self] (newLocation) in
        self.forecastWeatherViewModel?.updateWeatherInfo(latitude: 20, longtitude: 40, handler: {(weatherData, error) in
                      DispatchQueue.main.async {
                        self.tableView.reloadData()
                      }
                  })
                  
    }
        
    
    
    @objc func applicationDidBecomeActive(notification: Notification) {
         locationManager?.requestLocation()
        self.tableView.reloadData()
     }
     
     private func notificationsHandler() {
         let notificationCenter = NotificationCenter.default
         notificationCenter.addObserver(self, selector: #selector(applicationDidBecomeActive(notification:)), name: UIApplication.didBecomeActiveNotification, object: nil)
     }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ((self.forecastWeatherViewModel?.numberOfRows())!)
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ForecastTableViewCell
              
          guard let tableViewCell = cell, let viewModel = forecastWeatherViewModel else { return UITableViewCell() }
           
           let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)

        tableViewCell.viewModel = cellViewModel

           return tableViewCell

    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     
      
    return x[section]
       
        return nil
    }

 
 
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
