import XCTest
@testable import VerbuiseCore

final class VerbuiseCoreTests: XCTestCase {
    func testExample() throws {
        let vb: Verbuise = Verbuise(apiKey: "", project: "", organization: "", liveLanguageCode: .english)
        
        print("hello world".localize(vb))
    }
}
