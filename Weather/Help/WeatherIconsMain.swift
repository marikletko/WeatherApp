import Foundation
import UIKit

class WeatherIconsMain: UIView {

    @IBOutlet var iconIMG: UIImageView!
    @IBOutlet var iconLabel: UILabel!

    var icon: String? {
        didSet {
            self.iconIMG.image = UIImage(named:icon!)
        }
    }
    var iconText: String? {
        didSet {
            self.iconLabel.text = iconText
        }
    }
    
    func instanceFromNin() -> WeatherIconsMain {
          return UINib(nibName: "WeatherIconsMain", bundle: nil).instantiate(withOwner: nil, options: nil).first as! WeatherIconsMain
      }

}
