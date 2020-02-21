
import UIKit

<<<<<<< HEAD
class StartViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var iconBottomLayoutConstraint: NSLayoutConstraint!
    @IBOutlet var bottomLayoutConstraint: NSLayoutConstraint!
    @IBOutlet var loginInput: UITextField!
    @IBOutlet var loginOutlet: UIButton!
     @IBOutlet var forgotPassword: UIButton!
    @IBOutlet var passwordOutlet: UITextField!
    @IBOutlet var loginErrorLabel: UILabel!
    
    @IBAction func loginButton(_ sender: Any) {
        if(loginInput.text == "pupa" && passwordOutlet.text == "pupalupa") {
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
          self.present(vc, animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "loggedin")
        } else {
            loginErrorLabel.text = "Incorrect login or password"
        }
    }
    
    @IBAction func gmailButton(_ sender: Any) {
          Singleton.shared.currentAccount = "gmail"
        let y = UserDefaults.standard.bool(forKey: "gmail")
        if(y == true) {
            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else { return }
                         self.navigationController?.pushViewController(controller, animated: true)
              UserDefaults.standard.set(true, forKey: "loggedin")
        } else {
            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "RegisterFirstViewController") as? RegisterFirstViewController else { return }
                                    self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func vkButton(_ sender: UIButton) {
          Singleton.shared.currentAccount = "vk"
        let y = UserDefaults.standard.bool(forKey: "vk")
               if(y == true) {
                   guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else { return }
                                self.navigationController?.pushViewController(controller, animated: true)
                  UserDefaults.standard.set(true, forKey: "loggedin")
               } else {
                   guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "RegisterFirstViewController") as? RegisterFirstViewController else { return }
                                           self.navigationController?.pushViewController(controller, animated: true)
               }
    }
    
    @IBAction func fbButton(_ sender: UIButton) {
        Singleton.shared.currentAccount = "fb"
        let y = UserDefaults.standard.bool(forKey: "fb")
               if(y == true) {
                   guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else { return }
                                self.navigationController?.pushViewController(controller, animated: true)
                  UserDefaults.standard.set(true, forKey: "loggedin")
               } else {
                   guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "RegisterFirstViewController") as? RegisterFirstViewController else { return }
                                           self.navigationController?.pushViewController(controller, animated: true)
               }
=======
class StartViewController: UIViewController {
    @IBOutlet var passwordInput: UITextField!
    @IBOutlet var loginInput: UITextField!
    @IBOutlet var forgotPassword: UILabel!
    @IBOutlet var loginOutlet: UIButton!
    
    @IBAction func loginButton(_ sender: Any) {
    }
    
    @IBAction func gmailButton(_ sender: Any) {
    }
    
    @IBAction func vkButton(_ sender: UIButton) {
    }
    
    @IBAction func fbButton(_ sender: UIButton) {
>>>>>>> 67af8c72a8647782c16906bfc8dd746f7c900ad4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        
        if(UserDefaults.standard.bool(forKey: "loggedin")) {
            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else { return }
                                                      self.navigationController?.pushViewController(controller, animated: false)
        }
        
        self.hideKeyboardWhenTappedAround()
        registerForKeyboardNotifications()
        loginOutlet.layer.cornerRadius = loginOutlet.frame.size.height / 2
        forgotPassword.titleLabel?.attributedText = NSAttributedString(string: "Forgot password?", attributes:
        [.underlineStyle: NSUnderlineStyle.single.rawValue])
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
                      bottomLayoutConstraint.constant = 139
                     iconBottomLayoutConstraint.constant = 124
                  } else {
                      bottomLayoutConstraint.constant = keyboardScreenEndFrame.height - 165
                    iconBottomLayoutConstraint.constant = 54
                  }

                  view.needsUpdateConstraints()

                  UIView.animate(withDuration: animationDuration) {
                      self.view.layoutIfNeeded()
                  }
        }
    
=======
        self.hideKeyboardWhenTappedAround()
        loginOutlet.layer.cornerRadius = loginOutlet.frame.size.height / 2
        forgotPassword.attributedText = NSAttributedString(string: "Forgot password?", attributes:
        [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
>>>>>>> 67af8c72a8647782c16906bfc8dd746f7c900ad4
    @IBAction func forgotPasswordButton(_ sender: Any) {
      }

}
