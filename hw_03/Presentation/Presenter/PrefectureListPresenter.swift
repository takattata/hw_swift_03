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
    
    func setupUI()
    func refreshData()
    func selectedItem(index: Int)
}

protocol PrefectureListPresenterView: class {
    func setupNavigation(title: String)
    func loadPrefectureListVM(prefectureListVM: PrefectureListViewModel)
    
    func segueWeather(prefectureId: String)
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
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(useCase: PrefectureListUseCase) {
        self.useCase = useCase
    }
    
    func setupUI() {
        view?.setupNavigation(title: "都道府県")
    }
    
    func refreshData() {
        useCase.getListData()
            .subscribe(
                onNext: { [weak self] prefectureListModel in
                    self?.prefectureListModel = prefectureListModel
                }, onError: { [weak self] error in
                    self?.errorHandling(error: error)
                }, onCompleted: nil, onDisposed: nil)
            .addDisposableTo(disposeBag)
    }

    func selectedItem(index: Int) {
        guard prefectureListModel.list.count > index else {
            return
        }
        let prefecture = prefectureListModel.list[index]

        view?.segueWeather(prefectureId: prefecture.id)
    }

    private func convertModelToVM(prefectureListModel: PrefectureListModel) {
        let listVM: PrefectureListViewModel = PrefectureListViewModel(prefectureList: prefectureListModel)
        view?.loadPrefectureListVM(prefectureListVM: listVM)
    }
    
    private func errorHandling(error: Error) {
        DispatchQueue.main.async { [weak self] in
            if let error = error as? WeatherAppError {
                self?.error = error
            }

            //FIXME:                self?.view?.changeStatus()

        }
    }
}
