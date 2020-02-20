
import UIKit

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
        } else {
            loginErrorLabel.text = "Incorrect login or password"
        }
    }
    
    @IBAction func gmailButton(_ sender: Any) {
    }
    
    @IBAction func vkButton(_ sender: UIButton) {
    }
    
    @IBAction func fbButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
      }

}
