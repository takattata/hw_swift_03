//
//  WeatherUseCase.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import RxSwift

protocol WeatherUseCase {
    func getWeatherData(prefectureId: String) -> Observable<WeatherModel>
}

struct WeatherUseCaseImpl: WeatherUseCase {
    let weatherRepository: WeatherRepository

    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func getWeatherData(prefectureId: String) -> Observable<WeatherModel> {
        return weatherRepository.getWeatherData(prefectureId: prefectureId)
            .map { weatherEntity -> WeatherModel in
                return WeatherModelTranslator().translate(weatherEntity)
            }
    }
}
