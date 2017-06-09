import Foundation

public struct App: Codable {
    public let id: String
    public let name: String
    public let platform: Platform

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
