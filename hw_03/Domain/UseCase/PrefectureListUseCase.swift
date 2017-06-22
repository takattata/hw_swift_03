//
//  PrefectureListUseCase.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import RxSwift

protocol PrefectureListUseCase {
    func getListData() -> Observable<PrefectureListModel>
}

struct PrefectureListUseCaseImpl: PrefectureListUseCase {
    let repository: PrefectureListRepository
    
    init(prefectureListRepository: PrefectureListRepository) {
        self.repository = prefectureListRepository
    }
    
    func getListData() -> Observable<PrefectureListModel> {
        return repository.getListData()
            .map { entity -> PrefectureListModel in
                return PrefectureListModelTranslator().translate(entity)
            }
    }
}
