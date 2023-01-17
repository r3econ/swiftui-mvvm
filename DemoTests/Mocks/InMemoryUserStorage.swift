import Foundation

class InMemoryUserStorage: UserStorage {

    private var user: User?

    func save(_ user: User?) throws {
        self.user = user
    }

    func load() -> User? {
        return user
    }
}
