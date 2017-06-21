//
//  PrefectureListViewModel.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation

protocol PrefectureListViewModelProtocol {
    func count() -> Int
    
    func PrefectureViewModelProtocol(index: Int) -> PrefectureViewModelProtocol
}

struct PrefectureListViewModel {
    fileprivate let prefectureList: PrefectureListModel
    
    init(prefectureList: PrefectureListModel) {
        self.prefectureList = prefectureList
    }
}

extension PrefectureListViewModel: PrefectureListViewModelProtocol {
    func count() -> Int {
        return prefectureList.list.count
    }
    
    func PrefectureViewModelProtocol(index: Int) -> PrefectureViewModelProtocol {
        return PrefectureViewModel(prefecture: prefectureList.list[index])
    }
}
