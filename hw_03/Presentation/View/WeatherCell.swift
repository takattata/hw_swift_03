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
        let url: URL = URL(string: "http://weather.livedoor.com/img/icon/9.gif")!//viewModel.imageUrl())!
        thumbnail.kf.setImage(with: url)
        let max: String = "最高気温: 30℃"//viewModel.max()
        maxLabel.attributedText = max.withNormalStyle(ofSize: 16)
        let min: String = "最低気温: 20℃"//viewModel.min()
        minLabel.attributedText = min.withNormalStyle(ofSize: 16)
        let desc: String = "天気の詳細説明"//viewModel.description()
        descText.attributedText = desc.withNormalStyle()
    }
}
