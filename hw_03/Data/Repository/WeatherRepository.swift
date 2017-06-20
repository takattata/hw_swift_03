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
    func getTodaysData(prefectureId: String) -> Observable<WeatherEntity>
}

struct WeatherRepositoryImpl: WeatherRepository {
    //TODO: 考える. DataStoreだとFactoryいたけど...??
    static let shared = WeatherRepositoryImpl()
    
    func getTodaysData(prefectureId: String) -> Observable<WeatherEntity> {
        let dataStore: WeatherDataStore = WeatherDataStoreFactory.createWeatherDataStore()
        
        return dataStore.getTodaysData(prefectureId: prefectureId)
    }
}
