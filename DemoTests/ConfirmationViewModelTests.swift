import XCTest
@testable import Demo

final class ConfirmationViewModelTests: XCTestCase {

    var userService: (any UserServiceProtocol)!

    override func setUpWithError() throws {
        userService = UserServiceMock()
    }

    override func tearDownWithError() throws {
        userService = nil
    }

    func testExposingCorrectFieldValues() throws {
        // Arrange
        let user = User(name: "John",
                        emailAddress: "correct@email.com",
                        birthDate: Date(2000, 10, 10)!)
        userService.register(user)

        // Act
        let viewModel = ConfirmationViewModel(userService: userService)

        // Assert
        XCTAssertEqual(viewModel.username, user.name, "John")
        XCTAssertEqual(viewModel.emailAddress, user.emailAddress, "correct@email.com")
    }

}
