import Foundation

public struct Commit: Codable {
    let tags: [String]
    let branch: String
    let sha: String
    let author: String
    let message: String
    let url: URL?

    private enum CodingKeys: String, CodingKey {
        case tags
        case branch
        case sha = "commit_sha"
        case author
        case message
        case url = "html_url"
    }
}
