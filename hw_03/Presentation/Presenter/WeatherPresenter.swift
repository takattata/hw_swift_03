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
    
//    func setupUI()
//    func refreshData()
}

protocol WeatherPresenterView: class {
    
}

class WeatherPresenterImpl: WeatherPresenter {
    weak var view: WeatherPresenterView?
    var error: WeatherAppError?
    private var weatherModel: WeatherModel! {
        didSet {
            convertModelToVM(weatherModel: weatherModel)
        }
    }
    
    let useCase: WeatherUseCase
    
    init(useCase: WeatherUseCase, index: Int) {
        self.useCase = useCase
    }
    
    private func convertModelToVM(weatherModel: WeatherModel) {
        let viewModel: WeatherViewModel = WeatherViewModel(weather: weatherModel)
        
//        view?.load
    }
}
