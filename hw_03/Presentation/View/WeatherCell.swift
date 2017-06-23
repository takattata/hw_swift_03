//
//  WeatherCell.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

//FIXME: WeatherForecastCellとか改名する.
class WeatherCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var descText: UITextView!
    
    var viewModel: WeatherViewModelProtocol! {
        didSet {
            update()
        }
    }
    
    private func update() {
        let url: URL = URL(string: viewModel.imageUrl())!
        thumbnail.kf.setImage(with: url)
        let max: String = viewModel.max()
        maxLabel.attributedText = "最高気温: \(max)℃".withNormalStyle(ofSize: 16)
        let min: String = viewModel.min()
        minLabel.attributedText = "最低気温: \(min)℃".withNormalStyle(ofSize: 16)
        let desc: String = viewModel.description()
        descText.attributedText = desc.withNormalStyle()
    }
}
