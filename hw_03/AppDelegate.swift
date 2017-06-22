//
//  AppDelegate.swift
//  hw_03
//
//  Created by Takashima on 2017/06/19.
//  Copyright © 2017年 taka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        //FIXME: Routingに逃がせないかな?
        let vc: PrefectureListViewController = UIStoryboard(name: "PrefectureListViewController", bundle: nil).instantiateInitialViewController() as! PrefectureListViewController
        let repository: PrefectureListRepository = PrefectureListRepositoryImpl()
        let useCase: PrefectureListUseCase = PrefectureListUseCaseImpl(prefectureListRepository: repository)
        let presenter: PrefectureListPresenter = PrefectureListPresenterImpl(useCase: useCase)
        var routing: PrefectureListRouting = PrefectureListRoutingImpl()
        routing.viewController = vc

        vc.injection(presenter: presenter, routing: routing)
        let navigation = UINavigationController(rootViewController: vc)
        navigation.navigationBar.barTintColor = UIColor.orange
        navigation.navigationBar.tintColor = UIColor.white
        navigation.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        window?.rootViewController = navigation

        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

