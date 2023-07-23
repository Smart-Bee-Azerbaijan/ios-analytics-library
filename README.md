# SmartBee

A description of this package.


Introduction
============

This documentation provides a step-by-step guide on how to integrate your Android application with SmartBeeAnalytics.

Integration Steps
-----------------

Follow the steps below to integrate YourApp with SmartBeeAnalytics:

### Step 1: Import SmartBeeAnalytics SDK

1.  Place the SmartBeeAnalytics SDK files in a location accessible within your YourApp project.
2.  Open your project's `build.gradle` file and add the SmartBeeAnalytics SDK as a dependency.

    
    dependencies {
        implementation files('libs/SmartBeeAnalytics_1.0.0.aar')
    }
        

### Step 2: Initialize SmartBeeAnalytics

In your `YourApp` class that extends `Application`, override the `onCreate` method, and initialize the SmartBeeAnalytics SDK with your credentials.

    
    class YourApp : Application() {
        override fun onCreate() {
            super.onCreate()
    
            // Initialize SmartBeeAnalytics
            SmartBeeAnalytics.initialize(this)
        }
    }
        

### Step 3: Set token

    
    SmartBeeAnalytics.instance().setToken(YOUR_TOKEN)
        

### Step 4: Sending Events

To send events to SmartBeeAnalytics, you can use the `sendEvent` method. Here's an example of how to use it:

    
    private fun sendEvent() {
        // Create a HashMap to store event parameters (optional)
        val eventParameters = hashMapOf(
            "parametr1" to "Value1",
            "parametr2" to "Value2"
        )
    
        // Send the event to SmartBeeAnalytics
        SmartBeeAnalytics.instance().sendEvent(
            eventType = "Your event type",
            idHash = "Your id hash",
            utmSource = "Your utm source",
            utmCampaign = "Your utm campaingn",
            parameters = eventParameters
        )
    }
        

Adjust the event type, idHash, utmSource, utmCampaign, and event parameters according to the events you want to track in YourApp.

Conclusion
----------

Congratulations! You have successfully integrated YourApp with SmartBeeAnalytics. Your application is now ready to track various events and interactions, providing valuable analytics data to help you make informed decisions and enhance the user experience.

If you encounter any issues during the integration process or have questions about using SmartBeeAnalytics, please refer to their official documentation or contact their support team for assistance.
