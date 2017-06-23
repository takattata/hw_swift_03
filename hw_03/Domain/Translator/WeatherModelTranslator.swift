//
//  WeatherModelTranslator.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation

struct WeatherModelTranslator: Translator {
    private enum Day: Int {
        case Today
        case Tommorow
        case DayAfterTommorow
    }
    
    func translate(_ entity: WeatherEntity) -> WeatherModel {
        let title = entity.title ?? ""
        let description = entity.description ?? ""

        var url = ""
        var max = ""
        var min = ""
        if let forecast = entity.forecasts?[Day.Tommorow.rawValue] {
            url = forecast.imageUrl ?? ""
            max = forecast.max ?? ""
            min = forecast.min ?? ""
        }
        
        return WeatherModel(
            title: title,
            description: description,
            imageUrl: url,
            max: max,
            min: min
        )
    }
}
