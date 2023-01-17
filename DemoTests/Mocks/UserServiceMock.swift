#if DEBUG || TESTING

import Foundation

class UserServiceMock: UserServiceProtocol {
    var user: User?

    func register(_ user: Demo.User) {
        self.user = user
    }

    func unregister() {
        self.user = nil
    }
}

#endif
