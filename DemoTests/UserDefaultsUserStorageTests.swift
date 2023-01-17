import XCTest
@testable import Demo

final class UserDefaultsUserStorageTests: XCTestCase {

    private var storage: UserDefaultsUserStorage!

    override func setUpWithError() throws {
        storage = UserDefaultsUserStorage(
            defaults: UserDefaults(suiteName: "Test-\(Date().timeIntervalSince1970)")!)
    }

    override func tearDownWithError() throws {
        storage = nil
    }

    func testSavingLoadingUser() throws {
        // Arrange
        let user = User(name: "John",
                        emailAddress: "john@wayne.com",
                        birthDate: Date(2000, 10, 10)!)

        // Act
        try storage.save(user)
        let loadedUser = storage.load()

        // Assert
        XCTAssertEqual(user.name, loadedUser?.name)
        XCTAssertEqual(user.emailAddress, loadedUser?.emailAddress)
        XCTAssertEqual(user.birthDate, loadedUser?.birthDate)
    }

    func testClearingUserData() throws {
        // Arrange
        let user = User(name: "John",
                        emailAddress: "john@wayne.com",
                        birthDate: Date(2000, 10, 10)!)

        // Act
        try storage.save(user)
        try storage.save(nil)
        let loadedUser = storage.load()

        // Assert
        XCTAssertNil(loadedUser)
    }

}
