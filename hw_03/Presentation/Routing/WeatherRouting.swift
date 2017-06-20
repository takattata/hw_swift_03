//
//  WeatherRouting.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherRouting: Routing {
    func segueWeatherViewController()
}

class WeatherRoutingImpl: WeatherRouting {
    weak var viewController: UIViewController?
    
    func segueWeatherViewController() {
    }
}
