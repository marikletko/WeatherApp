//
//  RegisterSecondViewController.swift
//  Weather
//
//  Created by Kirill Letko on 2/19/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import UIKit

class RegisterSecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var sexBottomLayoutConstraint: NSLayoutConstraint!
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var sexTextField: UITextField!
    @IBOutlet var iconBottomLayoutConstraint: NSLayoutConstraint!
    @IBOutlet var workTextField: UITextField!
    @IBOutlet var bottomLayoutConstraint: NSLayoutConstraint!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var txtDatePicker: UITextField!
    let datePicker = UIDatePicker()
    let sexPicker = UIPickerView()
    var array = ["Male", "Female", "Agender", "Androgyne", "Androgynous", "Bigender", "Cis", "FTM", "Gender fluid", "Gender Noncomforming", "Gender Questioning", "Gender variant", "Gender Variant", "Genderqueer", "Neutrois", "Non-binary", "Pangender", "Two-spirit", "Other"]
      override func viewDidLoad() {
        super.viewDidLoad()
        workTextField.delegate = self
        continueButton.isEnabled = false
        txtDatePicker.delegate = self
        sexTextField.delegate = self
        sexPicker.delegate = self
        sexPicker.dataSource = self
        registerForKeyboardNotifications()
        self.hideKeyboardWhenTappedAround()
      }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField === txtDatePicker) {
            showDatePickerDate()
        } else {
            showDatePickerSex()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
          if(txtDatePicker.text != "" && sexTextField.text != "" && workTextField.text != "" && addressTextField.text != "") {
                  continueButton.isEnabled = true
              }
    }
        
    
       // sexTextField.isEnabled = false
      //  workTextField.isEnabled = false
      //  addressTextField.isEnabled = false
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: NSNotification) {
         let userInfo = notification.userInfo!
               let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
               let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

               if notification.name == UIResponder.keyboardWillHideNotification {
                   bottomLayoutConstraint.constant = 85
                sexBottomLayoutConstraint.constant = 133
                iconBottomLayoutConstraint.constant = 130
               } else {
                   bottomLayoutConstraint.constant = keyboardScreenEndFrame.height
                sexBottomLayoutConstraint.constant = 30
                iconBottomLayoutConstraint.constant = 20
        }

               view.needsUpdateConstraints()

               UIView.animate(withDuration: animationDuration) {
                   self.view.layoutIfNeeded()
               }
     }


      func showDatePickerDate(){
        //Formate Date
        datePicker.datePickerMode = .date

       //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
      let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

     toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

      txtDatePicker.inputAccessoryView = toolbar
      txtDatePicker.inputView = datePicker
        
     }
    
     func showDatePickerSex(){
       //Formate Date
       datePicker.datePickerMode = .date

      //ToolBar
      let toolbar = UIToolbar();
      toolbar.sizeToFit()
      let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneSexPicker));
       let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
     let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelSexPicker));

    toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
       
       sexTextField.inputView = sexPicker
       sexTextField.inputAccessoryView = toolbar
       
    }

      @objc func donedatePicker(){
      //  sexTextField.isEnabled = true
      //  workTextField.isEnabled = true
      //  addressTextField.isEnabled = true
       let formatter = DateFormatter()
       formatter.dateFormat = "dd/MM/yyyy"
       txtDatePicker.text = formatter.string(from: datePicker.date)
       self.view.endEditing(true)
     }

     @objc func cancelDatePicker(){
    //    sexTextField.isEnabled = true
    //           workTextField.isEnabled = true
    //           addressTextField.isEnabled = true
        self.view.endEditing(true)
      }
    
    @objc func doneSexPicker(){
   //     sexTextField.isEnabled = true
   //     workTextField.isEnabled = true
   //     addressTextField.isEnabled = true
      
       self.view.endEditing(true)
     }

     @objc func cancelSexPicker(){
     //   sexTextField.isEnabled = true
     //          workTextField.isEnabled = true
     //          addressTextField.isEnabled = true
        self.view.endEditing(true)
      }
    }
  
extension RegisterSecondViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return array[row]
       }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.sexTextField.text = array[row]
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
