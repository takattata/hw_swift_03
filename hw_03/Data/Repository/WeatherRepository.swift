//
//  WeatherRepository.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import RxSwift

protocol WeatherRepository {
    func getWeatherData(prefectureId: String) -> Observable<WeatherEntity>
}

struct WeatherRepositoryImpl: WeatherRepository {
    static let shared = WeatherRepositoryImpl()
    
    func getWeatherData(prefectureId: String) -> Observable<WeatherEntity> {
        print("WeatherRepository::getWeatherData: call")
        let dataStore: WeatherDataStore = WeatherDataStoreFactory.createWeatherDataStore()
        
        return dataStore.getWeatherData(prefectureId: prefectureId)
    }
}
