import ObjectiveC

public class SmartBee: NSObject {
    
    public static let event = SmartBeeEvent()
    
    public override init() {
        
    }
}

public class SmartBeeEvent: NSObject {
    
    public var token: String?
    
    public func eventOccurred(eventType: String, idHash: String, utmSource: String, utmCampaign: String, parameters: Dictionary<String, Any>) {
        
    }
}
