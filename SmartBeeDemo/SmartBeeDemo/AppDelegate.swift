//
//  AppDelegate.swift
//  SmartBeeDemo
//
//  Created by elnursh on 18.07.23.
//

import UIKit
import SmartBee

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        SmartBee.config.token = ""
        
        return true
    }

}

