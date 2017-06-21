//
//  PrefectureViewModel.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation

protocol PrefectureViewModelProtocol {
    func name() -> String
    func id() -> String
}

struct PrefectureViewModel {
    fileprivate let prefecture: PrefectureModel
    
    init(prefecture: PrefectureModel) {
        self.prefecture = prefecture
    }
}

extension PrefectureViewModel: PrefectureViewModelProtocol {
    func name() -> String {
        return prefecture.name
    }
    
    func id() -> String {
        return prefecture.id
    }
    
}
