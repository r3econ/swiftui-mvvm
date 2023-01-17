import Foundation

protocol UserServiceProtocol: ObservableObject {

    var user: User? { get set }
    func register(_ user: User)
    func unregister()
}
