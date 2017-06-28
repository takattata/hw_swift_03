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
    func segueInformation(sender: Any)
    func segueWeather(prefectureId: String)
}

fileprivate extension Selector {
    static let tappedInformationButton =
        #selector(PrefectureListRoutingImpl.segueInformation(sender:))
}

class PrefectureListRoutingImpl: PrefectureListRouting {
    weak var viewController: UIViewController? {
        didSet {
            let icon: UIImage = UIImage.fontAwesomeIcon(
                name: .cog,
                textColor: .white,
                size: CGSize(width: 30, height: 30)
            )
            
            viewController?.navigationItem.rightBarButtonItem =
                UIBarButtonItem(
                    image: icon,
                    style: .plain,
                    target: self,
                    action: Selector.tappedInformationButton
                )
        }
    }
    
    @objc func segueInformation(sender: Any) {
        let vc: InformationViewController = UIStoryboard(name: "InformationViewController", bundle: nil).instantiateInitialViewController() as! InformationViewController
        let repository: InformationRepository = InformationRepositoryImpl.shared
        let useCase: InformationUseCase = InformationUseCaseImpl(repository: repository)
        let presenter: InformationPresenter = InformationPresenterImpl(useCase: useCase)
        //FIXME: やっぱりletでいいはずなんだが、何が違う?.
        var routing: InformationRouting = InformationRoutingImpl()
        
        vc.injection(presenter: presenter, routing: routing)
        routing.viewController = vc
        
        let navigation: UINavigationController = UINavigationController(rootViewController: vc)

        viewController?.navigationController?.present(navigation, animated: true, completion: nil)
    }
    
    func segueWeather(prefectureId: String) {
        let repository: WeatherRepository = WeatherRepositoryImpl.shared
        let useCase: WeatherUseCase = WeatherUseCaseImpl(weatherRepository: repository)
        let presenter: WeatherPresenter = WeatherPresenterImpl(useCase: useCase, prefectureId: prefectureId)
        var routing: WeatherRouting = WeatherRoutingImpl()
        let vc: WeatherViewController = UIStoryboard(name: "WeatherViewController", bundle: nil).instantiateInitialViewController() as! WeatherViewController
        
        routing.viewController = vc
        vc.injection(presenter: presenter, routing: routing)
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
