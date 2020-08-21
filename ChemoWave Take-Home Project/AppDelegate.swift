//
//  AppDelegate.swift
//  ChemoWave Take-Home Project
//
//  Created by Valerie Don on 8/20/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let frame = UIScreen.main.bounds
        let homeVC = HomeViewController()
        let mainVC = UINavigationController(rootViewController: homeVC)
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
        window?.frame = frame

        return true
    }
}

