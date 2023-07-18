import ObjectiveC
import Foundation

public class SmartBee: NSObject {
    
    public static let event = SmartBeeEvent()
    
    public override init() { }
}

public class SmartBeeEvent: NSObject {
    
    public var token: String?
    
    public func eventOccurred(eventType: String, idHash: String, utmSource: String, utmCampaign: String, parameters: Dictionary<String, String>) {
        guard let token else {
            logged("token is not set")
            return
        }
        
        guard let url = URL(string: "https://smartbee.az/event/request") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("\(token)", forHTTPHeaderField: "Authorization")
        
        let payload = EventRequestPayload(eventType: eventType, idHash: idHash, utmSource: utmSource, utmCampaign: utmCampaign, parameters: parameters)
        
        do {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            request.httpBody = try encoder.encode(payload)
        } catch let error {
            print(error.localizedDescription)
        }
        
        let dispatch = DispatchQueue.global(qos: .background)
        dispatch.async {
            let task = URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
                guard error == nil else {
                    logged(error!.localizedDescription)
                    return
                }
                guard let data = data else {
                    logged("empty data")
                    return
                }
            }
            
            task.resume()
        }
    }
    
    private func logged(_ log: String) {
        print("SMARTBEE EVENTLOG: ", log)
    }
}

struct EventRequestPayload: Codable {
    let eventType: String
    let idHash: String
    let utmSource: String
    let utmCampaign: String
    let parameters: [String: String]
}
