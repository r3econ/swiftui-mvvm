import XCTest
@testable import Demo

final class EmailValidationTests: XCTestCase {

    var regexValidator: RegexValidator!

    override func setUpWithError() throws {
        let rule = RegexRule.emailAddressRule
        regexValidator = RegexValidator(rules: [rule])
    }

    override func tearDownWithError() throws {
        regexValidator = nil
    }

    func testValidatingCorrectEmailAddress() throws {

        let error = regexValidator.validate("email@example.com")
        XCTAssertNil(error)
    }

    func testValidatingIncorrectEmailAddress() throws {

        let error = regexValidator.validate("email@e")
        XCTAssertNotNil(error)
    }

}
