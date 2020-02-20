
import UIKit

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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        loginOutlet.layer.cornerRadius = loginOutlet.frame.size.height / 2
        forgotPassword.attributedText = NSAttributedString(string: "Forgot password?", attributes:
        [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
      }

}
