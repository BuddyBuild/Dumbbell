import Foundation

public struct Links: Codable {
    let download: [Link]
    let install: [Link]
}

public struct Link: Codable {
    let name: String
    let url: URL
}
