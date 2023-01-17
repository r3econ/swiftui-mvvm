import Foundation
import Combine

class UserService: UserServiceProtocol, ObservableObject {

    private let userStorage: UserStorage
    @Published var user: User?

    init(storage: UserStorage = UserDefaultsUserStorage()) {
        userStorage = storage
        user = storage.load()
    }

    func register(_ user: User) {
        self.user = user

        // TODO: Handle error
        try! userStorage.save(user)
    }

    func unregister() {
        self.user = nil
        try! userStorage.save(nil)
    }

}
