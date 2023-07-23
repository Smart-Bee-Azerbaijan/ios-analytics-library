Introduction
============

This documentation provides a step-by-step guide on how to integrate your iOS application with SmartBeeAnalytics.

Integration Steps
-----------------

Follow the steps below to integrate YourApp with SmartBeeAnalytics:

### Step 1: Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate SmartBeeAnalytics into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/elem577/SmartBeeAnalyticsiOS.git", .upToNextMajor(from: "1.0.0"))
]
```
        

### Step 2: Set token

```swift
import UIKit
import SmartBeeAnalytics

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        SmartBeeAnalytics.shared.token = YOUR_TOKEN
        
        return true
    }
}
```
        

### Step 3: Sending Events

To send events to SmartBeeAnalytics, you can use the `eventOccurred` method. Here's an example of how to use it:

```swift
func eventOccurred() {
    // Create a Dictionary to store event parameters (optional)
    let eventParameters = [
        "parametr1": "Value1",
        "parametr2": "Value2"
    ]

    // Send the event to SmartBeeAnalytics
    SmartBeeAnalytics.shared.eventOccurred(
        eventType: "Your event type",
        idHash: "Your id hash",
        utmSource: "Your utm source",
        utmCampaign: "Your utm campaingn",
        parameters: eventParameters
    )
}
```
        

Adjust the event type, idHash, utmSource, utmCampaign, and event parameters according to the events you want to track in YourApp.

Conclusion
----------

Congratulations! You have successfully integrated YourApp with SmartBeeAnalytics. Your application is now ready to track various events and interactions, providing valuable analytics data to help you make informed decisions and enhance the user experience.

If you encounter any issues during the integration process or have questions about using SmartBeeAnalytics, please refer to their official documentation or contact their support team for assistance.
