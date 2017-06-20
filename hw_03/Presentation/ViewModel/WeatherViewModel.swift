//
//  WeatherViewModel.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation

protocol WeatherViewModelProtocol {
    func title() -> String
    func description() -> String
    func imageUrl() -> String
    func max() -> String
    func min() -> String
}

struct WeatherViewModel {
    fileprivate let weather: WeatherModel
    
    init(weather: WeatherModel) {
        self.weather = weather
    }
}

extension WeatherViewModel: WeatherViewModelProtocol {
    //TODO: 他の書き方見てみる. 
    func title() -> String {
        return weather.title
    }
    
    func description() -> String {
        return weather.description
    }
    
    func imageUrl() -> String {
        return weather.imageUrl
    }
    
    func max() -> String {
        return weather.max
    }
    
    func min() -> String {
        return weather.min
    }
}
