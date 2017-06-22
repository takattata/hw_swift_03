//
//  InformationDataStore.swift
//  hw_03
//
//  Created by Takashima on 2017/06/22.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RxSwift

protocol InformationDataStore {
    func sendInformation(name: String?, email: String?, message: String?) -> Observable<Void>
}

struct InformationDataStoreImpl: InformationDataStore {
    func sendInformation(name: String?, email: String?, message: String?) -> Observable<Void> {
        guard let name = name, let email = email, let message = message else {
            return Observable.error(WeatherAppError.noParameter)
        }
        
        let jsonMessage: JSON = JSON([
            "channel": "#times_taka",
            "username": "test-taka",
            "text": "名前: \(name), メールアドレス: \(email), 本文: \(message)"
        ])
        
        return Observable.create { observer -> Disposable in
            Alamofire.request(
                "***slackURL***",
                method: .post,
                parameters: jsonMessage.dictionaryObject,
                encoding: JSONEncoding.default,
                headers: nil)
                .responseJSON { response/*(response: DataResponse<JSON>)*/ in
                    switch response.result {
                    case .success:
                        observer.onCompleted()
                    case .failure:
                        observer.onError(WeatherAppError.network)
                    }
            }
            
            return Disposables.create()
            //FIXME: PrefectureListに飛ぶ.
        }
    }
}

struct InformationDataStoreFactory {
    static func createInformationDataStore() -> InformationDataStore {
        return InformationDataStoreImpl()
    }
}
