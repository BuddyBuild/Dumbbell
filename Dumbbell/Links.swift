import Foundation

struct Links: Codable {
    let download: [Link]
    let install: [Link]
}

struct Link: Codable {
    let name: String
    let url: URL
}
