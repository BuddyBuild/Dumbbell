import Foundation

public struct Build: Codable {
    let id: String
    let appId: String
    let repoURL: URL
    let buildStatus: Status
    let finished: Bool
    let commit: Commit
    let number: Int
    let createdAt: Date
    let startedAt: Date?
    let finishedAt: Date?
    let tests: TestSummary
    let links: Links

    public enum Status: String, Codable {
        case failed
        case success
    }

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case appId = "app_id"
        case repoURL = "repo_url"
        case buildStatus = "build_status"
        case finished
        case commit = "commit_info"
        case number = "build_number"
        case createdAt = "created_at"
        case startedAt = "started_at"
        case finishedAt = "finished_at"
        case tests = "test_summary"
        case links
    }
}

