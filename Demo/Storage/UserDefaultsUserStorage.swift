import Foundation

class UserDefaultsUserStorage: UserStorage {

    static private let userKey = "User"
    private let defaults: UserDefaults
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    init(defaults: UserDefaults = UserDefaults.standard) {
        self.defaults = defaults
    }

    func save(_ user: User?) throws {

        if user == nil {
            defaults.removeObject(forKey: Self.userKey)
        } else {
            let encoded = try encoder.encode(user)
            defaults.set(encoded, forKey: Self.userKey)
        }
    }

    func load() -> User? {

        guard let data = defaults.object(forKey: Self.userKey) as? Data else {
            return nil
        }

        return try? decoder.decode(User.self, from: data)
    }
}
