//
//  PrefectureListRepository.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import RxSwift

protocol PrefectureListRepository {
    func getListData() -> Observable<PrefectureListEntity>
}

struct PrefectureListRepositoryImpl: PrefectureListRepository {
    static let shared = PrefectureListRepositoryImpl()
    
    func getListData() -> Observable<PrefectureListEntity> {
        let dataStore: PrefectureListDataStore = PrefectureListDataStoreFactory.createPrefectureListDataStore()
        
        return dataStore.getListData()
    }
}
