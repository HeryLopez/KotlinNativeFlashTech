//
//  AppDelegate.swift
//  KotlinIOS
//
//  Created by hlopez on 14/11/2019.
//  Copyright © 2019 hlopez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // (1)
         window = UIWindow(frame: UIScreen.main.bounds)
         // (2)
         window?.rootViewController = ViewController()
         // (3)
         window?.makeKeyAndVisible()
        
        return true
    }
}

