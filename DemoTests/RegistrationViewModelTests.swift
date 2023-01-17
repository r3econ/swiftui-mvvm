import XCTest
@testable import Demo

final class RegistrationViewModelTests: XCTestCase {

    var viewModel: RegistrationViewModel!
    var userService: (any UserServiceProtocol)!

    override func setUpWithError() throws {
        userService = UserServiceMock()
        viewModel = RegistrationViewModel(userService: userService)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testMarkingModelViewAsValid() throws {
        // Arrange
        viewModel.username = "John"
        viewModel.emailAddress = "correct@email.com"

        // Assert
        XCTAssertTrue(viewModel.isValid)
    }

    func testMarkingModelViewAsInvalid_WrongEmail() throws {
        // Arrange
        viewModel.username = "John"
        viewModel.emailAddress = "wrong-email"
        viewModel.dateOfBirth = Date(1900, 1, 1)!

        // Assert
        XCTAssertFalse(viewModel.isValid)
    }

    func testMarkingModelViewAsInvalid_WrongUsername() throws {
        // Arrange
        viewModel.username = " "
        viewModel.emailAddress = "correct@email.com"
        viewModel.dateOfBirth = Date(1900, 1, 1)!

        // Assert
        XCTAssertFalse(viewModel.isValid)
    }

    func testMarkingModelViewAsInvalid_WrongDateOfBirth() throws {
        // Arrange
        viewModel.username = "John"
        viewModel.emailAddress = "correct@email.com"
        viewModel.dateOfBirth = Date(800, 1, 1)!

        // Assert
        XCTAssertFalse(viewModel.isValid)
    }

    func testRegisteringWithCorrectData() throws {
        // Arrange
        viewModel.username = "John"
        viewModel.emailAddress = "correct@email.com"
        viewModel.dateOfBirth = Date(1990, 1, 1)!

        // Act
        viewModel.register()

        // Assert
        XCTAssertNotNil(userService.user)
    }

    func testRegisteringWithIncorrectData() throws {
        // Arrange
        viewModel.username = "John"
        viewModel.emailAddress = ""
        viewModel.dateOfBirth = Date(1990, 1, 1)!

        // Act
        viewModel.register()

        // Assert
        XCTAssertNil(userService.user)
    }

}
