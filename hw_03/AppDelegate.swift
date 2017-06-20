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
        
        let vc = UIStoryboard(name: "PrefectureListViewController", bundle: nil).instantiateInitialViewController()!
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

