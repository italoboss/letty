//
//  AppDelegate.swift
//  Letterin
//
//  Created by Italo Boss on 25/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            let rootViewController = MainViewController()
            window.backgroundColor = .white
            window.tintColor = .black
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
        }
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        _ = CoreDataManager.shared.saveContext()
    }

}

