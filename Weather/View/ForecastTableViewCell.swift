import UIKit

final class ForecastTableViewCell: UITableViewCell {
    
    @IBOutlet var foreImage: UIImageView!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
 weak var viewModel: ForecastWeatherCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            foreImage.image = UIImage(named:viewModel.foreImage)
            descLabel.text = viewModel.descLabel
            tempLabel.text = viewModel.tempLabel
            timeLabel.text = viewModel.time
        }
    }
}
