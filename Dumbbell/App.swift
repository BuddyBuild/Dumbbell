import Foundation

public struct App: Codable {
    let id: String
    let name: String
    let platform: Platform

    public enum Platform: String, Codable {
        case ios
        case android
        case web
    }

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "app_name"
        case platform
    }
}
