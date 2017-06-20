//
//  PrefectureListDataStore.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import RxSwift

protocol PrefectureListDataStore {
    func getListData() -> Observable<PrefectureListEntity>
}

//TODO: わざわざここに出す必要あるのか??
struct PrefectureListDataStoreImpl: PrefectureListDataStore {
    func getListData() -> Observable<PrefectureListEntity> {
        return Observable.create( { (observer) -> Disposable in
            let prefectures: [(name: String, id: String)] = [
                ("埼玉", "110010"),
                ("東京", "130010"),
                ("千葉", "120010"),
                ("静岡", "220010"),
                ("茨城", "080010"),
                ("山梨", "190010"),
                ("群馬", "100010"),
                ("岩手", "030010"),
                ("福島", "070010"),
            ]
            
            let object: PrefectureListEntity = PrefectureListEntity(list: prefectures)
            
            observer.onNext(object)
            observer.onCompleted()
            
            return Disposables.create()
        } )
    }
}

struct  PrefectureListDataStoreFactory {
    static func createPrefectureListDataStore() -> PrefectureListDataStore {
        return PrefectureListDataStoreImpl()
    }
}
