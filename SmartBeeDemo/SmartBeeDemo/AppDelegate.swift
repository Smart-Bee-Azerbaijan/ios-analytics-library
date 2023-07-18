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
        
        SmartBee.event.token = ""

        SmartBee.event.eventOccurred(eventType: "", idHash: "", utmSource: "", utmCampaign: "", parameters: [:])
        
        return true
    }

}

