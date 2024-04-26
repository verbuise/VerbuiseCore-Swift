import XCTest
@testable import VerbuiseCore

final class VerbuiseCoreTests: XCTestCase {
    func testExample() async throws {
        var vb: Verbuise = await Verbuise(apiKey: "", project: "", organization: "", liveLanguageCode: .english)
            
        print(vb)
        
        print(vb.localize("hello greeting login_button"))
        
        vb.liveLanguageCode = .spanish
        
        print(vb.localize("hello greeting login_button"))

    }
}
