//
//  NewPasswordViewController.swift
//  Weather
//
//  Created by Kirill Letko on 2/20/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import UIKit

class NewPasswordViewController: UIViewController {

    @IBOutlet var bottomLayoutConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
registerForKeyboardNotifications()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: NSNotification) {
         let userInfo = notification.userInfo!
               let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
               let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

               if notification.name == UIResponder.keyboardWillHideNotification {
                   bottomLayoutConstraint.constant = 80
               } else {
                   bottomLayoutConstraint.constant = keyboardScreenEndFrame.height
               }

               view.needsUpdateConstraints()

               UIView.animate(withDuration: animationDuration) {
                   self.view.layoutIfNeeded()
               }
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
