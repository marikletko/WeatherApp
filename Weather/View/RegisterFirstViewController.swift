//
//  RegisterFirstViewController.swift
//  Weather
//
//  Created by Kirill Letko on 2/19/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import UIKit

class RegisterFirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var emailOutlet: UITextField!
    @IBOutlet var loginOutlet: UITextField!
 @IBOutlet var continueButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    @IBOutlet var reenterLabel: UITextField!
    @IBOutlet var passwordOutlet: UITextField!
    @IBOutlet var passwordBottomLayoutConstraint: NSLayoutConstraint!
    @IBOutlet var iconBottomLayoutConstraint: NSLayoutConstraint!
    @IBOutlet var bottomLayoutConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         registerForKeyboardNotifications()
        loginOutlet.delegate = self
        passwordOutlet.delegate = self
        reenterLabel.delegate = self
        emailOutlet.delegate = self
        continueButton.isEnabled = false
        self.hideKeyboardWhenTappedAround()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(loginOutlet.text == "Pepega") {
            errorLabel.text = "This login was already used"
            continueButton.isEnabled = false
        }
        
        if(loginOutlet.text != nil && loginOutlet.text != "") {
        if(loginOutlet.text!.count < 3 || loginOutlet.text!.count > 16) {
            errorLabel.text = "Login is not valid due to length"
            continueButton.isEnabled = false
        }
        }
        
        if(passwordOutlet.text != nil && passwordOutlet.text != "") {
            if(passwordOutlet.text!.count < 8 || passwordOutlet.text!.count > 16) {
                errorLabel.text = "Password is not valid due to length"
                continueButton.isEnabled = false
            }
        }
        
        if(emailOutlet.text != nil && emailOutlet.text != "") {
            if(!emailOutlet.text!.contains("@") && !emailOutlet.text!.contains(".")) {
                errorLabel.text = "Wrong email"
                continueButton.isEnabled = false
            } else {
              
            }
        }
        
        if((reenterLabel.text != passwordOutlet.text) && reenterLabel.text != "") {
                   continueButton.isEnabled = false
            errorLabel.text = "Passwords not match"
               } else {
                   continueButton.isEnabled = true
               }
    
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        errorLabel.text = ""
    continueButton.isEnabled = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorLabel.text = ""
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
                   bottomLayoutConstraint.constant = 81
                iconBottomLayoutConstraint.constant = 130
                passwordBottomLayoutConstraint.constant = 133
               } else {
                   bottomLayoutConstraint.constant = keyboardScreenEndFrame.height
                iconBottomLayoutConstraint.constant = 20
                passwordBottomLayoutConstraint.constant = 45
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
