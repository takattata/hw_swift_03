//
//  PrefectureListRouting.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit

protocol PrefectureListRouting: Routing {
    func seguePrefectureViewController(index: Int)
}

class PrefectureListRoutingImpl: PrefectureListRouting {
    weak var viewController: UIViewController?
    
    func seguePrefectureViewController(index: Int) {
        let weatherRepository: WeatherRepository = WeatherRepositoryImpl.shared

        let useCase: WeatherUseCase = WeatherUseCaseImpl(weatherRepository: weatherRepository)
        let presenter: WeatherPresenter = WeatherPresenterImpl(useCase: useCase, index: index)
        //TODO: これclassだからletでも大丈夫じゃなかった??
//        let routing: WeatherRouting = WeatherRoutingImpl()
        var routing: WeatherRouting = WeatherRoutingImpl()
        let vc: WeatherViewController = UIStoryboard(name: "WeatherViewController", bundle: nil).instantiateInitialViewController() as! WeatherViewController
        
        vc.injection(presenter: presenter, routing: routing)
        routing.viewController = vc
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
