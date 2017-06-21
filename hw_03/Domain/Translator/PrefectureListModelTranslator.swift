//
//  PrefectureListModelTranslator.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation

struct PrefectureListModelTranslator: Translator {
    func translate(_ entity: PrefectureListEntity) -> PrefectureListModel {
        var prefectureModels: [PrefectureModel] = []
        for pair in entity.list {
            prefectureModels.append(PrefectureModel(name: pair.name, id: pair.id))
        }

        return PrefectureListModel(
            list: prefectureModels
        )
    }
}
