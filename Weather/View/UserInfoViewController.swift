//
//  UserInfoViewController.swift
//  Weather
//
//  Created by Kirill Letko on 2/21/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
     @IBOutlet var userInfoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        userInfoLabel.text =
        "userEmail : marikletko48@gmail.com\n" +
        "userWork : Innowise-group\n" +
        "userAddress : Kuzmy Chornogo street 18, 30\n" +
        "userAge : 32 years\n" +
        "userSex : Male\n" +
        "userCountry : Belarus\n" +
        "userCity : Minsk\n" +
        "userZip : 220012"
    }

    @IBAction func logOutButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "loggedin")
        navigationController?.popToRootViewController(animated: true)
        
    }
}
