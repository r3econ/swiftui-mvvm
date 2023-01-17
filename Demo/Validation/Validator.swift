import Foundation

protocol Validator {

    func validate(_ value: Any) -> ValidationError?
}
