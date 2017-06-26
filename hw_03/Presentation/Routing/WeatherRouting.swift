//
//  WeatherRouting.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherRouting: Routing {
//    func seguePrefectureList()
}

class WeatherRoutingImpl: WeatherRouting {
    weak var viewController: UIViewController?
//    
//    func seguePrefectureList() {
//        let vc: PrefectureListViewController = UIStoryboard(name: "PrefectureListViewController", bundle: nil).instantiateInitialViewController() as! PrefectureListViewController
//        let repository: PrefectureListRepository = PrefectureListRepositoryImpl.shared
//        let useCase: PrefectureListUseCase = PrefectureListUseCaseImpl(repository: repository)
//        let presenter: PrefectureListPresenter = PrefectureListPresenterImpl(useCase: useCase)
//        //FIXME: やっぱりletでいいはずなんだが、何が違う?.
//        var routing: PrefectureListRouting = PrefectureListRoutingImpl()
//        
//        routing.viewController = vc
//        vc.injection(presenter: presenter, routing: routing)
//        
//        viewController?.navigationController?.present(vc, animated: true)
//    }
}
