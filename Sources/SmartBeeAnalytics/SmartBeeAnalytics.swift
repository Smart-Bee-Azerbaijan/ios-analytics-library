import ObjectiveC
import Foundation

public class SmartBeeAnalytics: NSObject {
    
    public static let shared = SmartBeeAnalytics()
    
    public override init() { }
    
    public var token: String?

    
    public func eventOccurred(eventType: String, idHash: String, utmSource: String, utmCampaign: String, parameters: Dictionary<String, String>) {
        
        self.eventRequest(eventType: eventType,
                                  idHash: idHash,
                                  utmSource: utmSource,
                                  utmCampaign: utmCampaign,
                                  parameters: parameters,
                                  isTry: false)
    }
    
    private func eventRequest(eventType: String, idHash: String, utmSource: String, utmCampaign: String, parameters: Dictionary<String, String>, isTry: Bool) {
        
        guard let token else {
            logged("token is not set")
            return
        }
        
        guard let url = URL(string: "https://cdnsb.net/mobile_app_events") else { return }
        
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
                    
                    if isTry == false {
                        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
                            self.eventRequest(
                                eventType: eventType,
                                idHash: idHash,
                                utmSource: utmSource,
                                utmCampaign: utmCampaign,
                                parameters: parameters,
                                isTry: true)
                        }
                    }
                    return
                }
//                guard let data = data else {
//                    logged("empty data")
//                    return
//                }
//                print("log: ", data, response)
            }
            
            task.resume()
        }
    }
    
    private func logged(_ log: String) {
        print("SMARTBEE ANALYTICS LOG: ", log)
    }
}
