//
//  WeatherPresenter.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import RxSwift

protocol WeatherPresenter {
    weak var view: WeatherPresenterView? { get set }
    var error: WeatherAppError? { get set }
    
    func setupUI()
    func refreshData()
}

protocol WeatherPresenterView: class {
    func setupNavigation(title: String)
    func loadWeatherVM(weatherVM: WeatherViewModel)
}

class WeatherPresenterImpl: WeatherPresenter {
    weak var view: WeatherPresenterView?
    var error: WeatherAppError?
    private var weatherModel: WeatherModel! {
        didSet {
            convertModelToVM(weatherModel: weatherModel)
        }
    }

    //FIXME: これここに書くので良いのだろうか?mamanote見る
    let prefectureId: String
    let useCase: WeatherUseCase
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(useCase: WeatherUseCase, prefectureId: String) {
        self.useCase = useCase
        self.prefectureId = prefectureId
    }
    
    func setupUI() {
        view?.setupNavigation(title: "天気")//weatherModel.title)
    }
    
    func refreshData() {
        print("WeatherPresenter::refreshData: call")
        useCase.getWeatherData(prefectureId: self.prefectureId)
            .subscribe(
                onNext: { [weak self] weatherModel in
                    //                    self?.view?.changePrefectureListStatus
                    self?.weatherModel = weatherModel
                    print("useCase.getWeatherData: onNext \(weatherModel.title)")
                }, onError: { [weak self] error in
                    self?.errorHandling(error: error)
                    print("useCase.getWeatherData: onError##")
                }, onCompleted: nil, onDisposed: nil)
            .addDisposableTo(disposeBag)
    }
    
    private func convertModelToVM(weatherModel: WeatherModel) {
        let weatherVM: WeatherViewModel = WeatherViewModel(weather: weatherModel)
        view?.loadWeatherVM(weatherVM: weatherVM)
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
