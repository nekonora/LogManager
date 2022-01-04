import XCTest
@testable import LogManager

final class LogManagerTests: XCTestCase {
    
    var logger: LogManager!
    
    override func setUp() {
        super.setUp()
        self.logger = LogManager.shared
    }
    
    override func tearDown() {
        self.logger = nil
        super.tearDown()
    }
}
