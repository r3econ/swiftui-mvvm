import XCTest

final class DemoAppUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()

        // Set launch argument that will be checked when the app
        // is launched to set up the mocks.
        app.launchArguments = [UITestingHelper.processInfoUITestingArgument]
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testRegistrationFormInitialEmptyState() throws {
        // Arrange
        let title = app.staticTexts["Register title"]
        let usernameField = app.textFields["Username text field"]
        let emailTextField = app.textFields["Email address text field"]
        let registerButton = app.buttons["Register button"]

        // Assert
        XCTAssert(title.exists)
        XCTAssertEqual(title.label, "Register")

        XCTAssert(usernameField.exists)
        XCTAssert(emailTextField.exists)

        XCTAssert(registerButton.exists)
        XCTAssertEqual(registerButton.label, "Register")
        XCTAssertFalse(registerButton.isEnabled)
    }

    func testThatRegisterButtonGetsEnabled() throws {
        // Arrange
        let usernameField = app.textFields["Username text field"]
        let emailTextField = app.textFields["Email address text field"]
        let registerButton = app.buttons["Register button"]

        // Act
        usernameField.tap()
        usernameField.typeText("John")
        emailTextField.tap()
        emailTextField.typeText("email@address.com")

        // Assert
        XCTAssertTrue(registerButton.isEnabled)
    }

    func testThatTypingIncorrectEmailShowsError() throws {
        // Arrange
        let usernameField = app.textFields["Username text field"]
        let emailTextField = app.textFields["Email address text field"]
        let errorsLabel = app.staticTexts["Errors text label"]

        // Act
        usernameField.tap()
        usernameField.typeText("John")
        emailTextField.tap()
        emailTextField.typeText("email@incorrect")

        // Assert
        XCTAssertFalse(errorsLabel.label.isEmpty)
    }

    func testThatSuccessfulRegisteringLeadsToConfirmationScreenWithCorrectData() throws {
        // Arrange
        let usernameField = app.textFields["Username text field"]
        let emailTextField = app.textFields["Email address text field"]
        let registerButton = app.buttons["Register button"]

        // Act
        // Fill in the data
        usernameField.tap()
        usernameField.typeText("John")
        emailTextField.tap()
        emailTextField.typeText("email@address.com")

        // Tap the register button
        registerButton.tap()

        // Assert
        let confirmationPageTitle = app.staticTexts["Confirmation title"]
        XCTAssert(confirmationPageTitle.waitForExistence(timeout: 1.0))
    }
}
