//
//  UserInfoViewController.swift
//  Weather
//
//  Created by Kirill Letko on 2/21/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func logOutButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "loggedin")
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    @IBOutlet var userInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
