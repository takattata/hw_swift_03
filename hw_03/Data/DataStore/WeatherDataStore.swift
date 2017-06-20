//
//  WeatherDataStore.swift
//  hw_03
//
//  Created by Takashima on 2017/06/19.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift
import SwiftyJSON

protocol WeatherDataStore {
    func getTodaysData(prefectureId: String) -> Observable<WeatherEntity>
}

struct WeatherDataStoreImpl: WeatherDataStore {
    func getTodaysData(prefectureId: String) -> Observable<WeatherEntity> {
        let url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=\(prefectureId)"
        
        return Observable.create( { (observer) -> Disposable in
            Alamofire.request(url).responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value).object
                    
                    guard let object = Mapper<WeatherEntity>().map(JSONObject: json) else {
                        observer.onError(WeatherError.generic)
                        return
                    }
                    
                    observer.onNext(object)
                    observer.onCompleted()
                case .failure:
                    observer.onError(WeatherError.network)
                }
            }

            return Disposables.create()
        } )
    }
}

struct  WeatherDataStoreFactory {
    static func createWeatherDataStore() -> WeatherDataStore {
        return WeatherDataStoreImpl()
    }
}
