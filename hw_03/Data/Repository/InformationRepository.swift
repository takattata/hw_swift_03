//
//  InformationRepository.swift
//  hw_03
//
//  Created by Takashima on 2017/06/22.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import RxSwift

protocol InformationRepository {
    func sendInformation(name: String?, email: String?, message: String?) -> Observable<Void>
}

struct InformationRepositoryImpl: InformationRepository {
    static let shared: InformationRepositoryImpl = InformationRepositoryImpl()
    
    func sendInformation(name: String?, email: String?, message: String?) -> Observable<Void> {
        let dataStore: InformationDataStore = InformationDataStoreFactory.createInformationDataStore()
        
        return dataStore.sendInformation(name: name, email: email, message: message)
    }
}
