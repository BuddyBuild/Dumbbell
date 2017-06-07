import Foundation

struct App: Codable {
    let id: String
    let name: String
    let platform: Platform

    enum Platform: String, Codable {
        case ios
        case android
    }

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "app_name"
        case platform
    }
}
