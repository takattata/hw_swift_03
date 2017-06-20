//
//  PrefectureListPresenter.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import RxSwift

protocol PrefectureListPresenter {
    weak var view: PrefectureListPresenterView? { get set }
    var error: WeatherAppError? { get set }
}

protocol PrefectureListPresenterView: class {
}

class PrefectureListPresenterImpl: PrefectureListPresenter {
    weak var view: PrefectureListPresenterView?
    var error: WeatherAppError?
    private var prefectureListModel: PrefectureListModel! {
        didSet {
            convertModelToVM(prefectureListModel: prefectureListModel)
        }
    }
    
    let useCase: PrefectureListUseCase
    
    init(useCase: PrefectureListUseCase) {
        self.useCase = useCase
    }
    
    private func convertModelToVM(prefectureListModel: PrefectureListModel) {
        let viewModel: PrefectureViewModel = PrefectureViewModel(prefectureList: prefectureListModel)
    }
}
