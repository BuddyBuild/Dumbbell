import Foundation

public struct TestSummary: Codable {
    let count: Int
    let passed: Int
    let codeCoverage: Double

    private enum CodingKeys: String, CodingKey {
        case count = "tests_count"
        case passed = "tests_passed"
        case codeCoverage = "code_coverage_percentage"
    }
}
