import XCTest
@testable import Dumbbell

class AppTests: XCTestCase {
    
    func testAppIsDecoded() {
        let payload = """
[
      {
            "_id": "58a4e07838704cb2eacd7ce4",
            "app_name": "2048 iOS App",
            "platform": "ios"
      },
      {
            "_id": "58a4e07838704cb2eacd7ce6",
            "app_name": "2048 Android App",
            "platform": "android"
      }
]
""".data(using: .utf8)!
        let decoder = JSONDecoder()
        let apps: [App] = try! decoder.decode(Array<App>.self, from: payload)
        XCTAssertEqual(apps.count, 2)
    }
}
