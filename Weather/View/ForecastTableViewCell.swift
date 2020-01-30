//
//  ForecastTableViewCell.swift
//  Weather
//
//  Created by Kirill Letko on 1/29/20.
//  Copyright © 2020 Letko. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
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
