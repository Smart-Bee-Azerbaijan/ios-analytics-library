//
//  AppDelegate.swift
//  SmartBeeDemo
//
//  Created by elnursh on 18.07.23.
//

import UIKit
import SmartBeeAnalytics

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        SmartBeeAnalytics.shared.token = "test token"
        
        SmartBeeAnalytics.shared.eventOccurred(eventType: "test type", idHash: "test id", utmSource: "test source", utmCampaign: "test campaign", parameters: ["test key": "test value"])
        
        return true
    }

}

