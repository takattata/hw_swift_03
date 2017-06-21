//
//  PrefectureListRouting.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import FontAwesome_swift
import UIKit

protocol PrefectureListRouting: Routing {
    func seguePrefectureList()
    func segueWeather(prefectureId: String)
}

class PrefectureListRoutingImpl: PrefectureListRouting {
    weak var viewController: UIViewController?
    
    func seguePrefectureList() {
    }
    
    func segueWeather(prefectureId: String) {
        let weatherRepository: WeatherRepository = WeatherRepositoryImpl.shared
        let useCase: WeatherUseCase = WeatherUseCaseImpl(weatherRepository: weatherRepository)
        let presenter: WeatherPresenter = WeatherPresenterImpl(useCase: useCase, prefectureId: prefectureId)
        //TODO: これclassだからletでも大丈夫じゃなかった??
//        let routing: WeatherRouting = WeatherRoutingImpl()
        var routing: WeatherRouting = WeatherRoutingImpl()
        let vc: WeatherViewController = UIStoryboard(name: "WeatherViewController", bundle: nil).instantiateInitialViewController() as! WeatherViewController
        
        routing.viewController = vc
        vc.injection(presenter: presenter, routing: routing)
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

//let icon = UIImage.fontAwesomeIcon(
//    code: "fa-cog",
//    textColor: UIColor.white,
//    size: CGSize(width: 30, height: 30)
//)
//
//viewController?.navigationItem.rightBarButtonItem =
//    UIBarButtonItem(
//        image: icon,
//        style: .plain,
//        target: self,
//        action: #selector(self.toInformationView)
//)
