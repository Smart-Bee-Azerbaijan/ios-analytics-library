//
//  EventRequest.swift
//  
//
//  Created by elnursh on 23.07.23.
//

import Foundation

struct EventRequestPayload: Codable {
    let eventType: String
    let idHash: String
    let utmSource: String
    let utmCampaign: String
    let parameters: [String: String]
}
