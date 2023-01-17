import Foundation

protocol UserStorage {
    func save(_ user: User?) throws
    func load() -> User?
}
