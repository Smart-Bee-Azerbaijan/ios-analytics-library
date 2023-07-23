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
        
        SmartBee.event.token = "test token"

        SmartBee.event.eventOccurred(eventType: "test type", idHash: "test id", utmSource: "test source", utmCampaign: "test campaign", parameters: ["test key": "test value"])
        
        return true
    }

}

