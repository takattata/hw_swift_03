//
//  WeatherEntity.swift
//  hw_03
//
//  Created by Takashima on 2017/06/19.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import ObjectMapper

struct ForecastEntity {
    var imageUrl: String?
    var max: String?
    var min: String?
}

extension ForecastEntity: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        imageUrl <- map["image.url"]
        max <- map["temperature.max.celsius"]
        min <- map["temperature.min.celsius"]
    }
}

struct WeatherEntity {
    var title: String?
    var description: String?
    var forecasts: [ForecastEntity]?
}

extension WeatherEntity: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        description <- map["description.text"]
        forecasts <- map["forecasts"]
    }
}
