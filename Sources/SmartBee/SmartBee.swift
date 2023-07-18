import ObjectiveC

public class SmartBee: NSObject {
    
    public static let config = SmartBee()

    public var token: String?
    
    public override init() {
        
    }
    
    public func eventOccurred(eventType: String, idHash: String, utmSource: String, utmCampaign: String, parameters: Dictionary<String, Any>) {
        
    }
}
