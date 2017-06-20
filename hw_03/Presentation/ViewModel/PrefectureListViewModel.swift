//
//  PrefectureListViewModel.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation

protocol PrefectureViewModelProtocol {
//    func count() -> Int

    func name() -> String
    func id() -> String
    
    //FIXME: indexをどう管理すれば良いのだろうか...
//    var index: Int { get set }
//    mutating  func setIndex(index: Int)
    func prefectureViewModelProtocol(index: Int) -> PrefectureViewModelProtocol
}

struct PrefectureViewModel {
    fileprivate let prefectureList: PrefectureListModel
    
//    var index: Int
    
    init(prefectureList: PrefectureListModel) {
        self.prefectureList = prefectureList
    }
}

extension PrefectureViewModel: PrefectureViewModelProtocol {
//    func count() -> Int {
//        return prefectureList.list.count
//    }
    
    func name() -> String {
        return prefectureList.list[0/*index*/].name
    }
    
    func id() -> String {
        return prefectureList.list[0/*index*/].id
    }
    
    func prefectureViewModelProtocol(index: Int) -> PrefectureViewModelProtocol {
        return PrefectureViewModel(prefectureList: prefectureList)
    }
}
