import XCTest
@testable import Demo

final class UsernameValidationTests: XCTestCase {

    var regexValidator: RegexValidator!

    override func setUpWithError() throws {
        let rule = RegexRule.usernameRule
        regexValidator = RegexValidator(rules: [rule])
    }

    override func tearDownWithError() throws {
        regexValidator = nil
    }

    func testValidatingCorrectUsername() throws {

        let error = regexValidator.validate("TestUsername")
        XCTAssertNil(error)
    }

    func testValidatingIncorrectUsername() throws {

        let error = regexValidator.validate(" ")
        XCTAssertNotNil(error)
    }

}
