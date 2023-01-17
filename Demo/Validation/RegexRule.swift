import Foundation

struct RegexRule {
    let pattern: Regex<AnyRegexOutput>
    let error: ValidationError

    static let emailAddressRule = RegexRule(
        pattern: try! Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"),
        error: .custom(message: "Incorrect email address"))

    /// Match a non-blank and non-empty string
    static let usernameRule = RegexRule(
        pattern: try! Regex("(.|\\s)*\\S(.|\\s)*"),
        error: .custom(message: "Invalid username"))
}
