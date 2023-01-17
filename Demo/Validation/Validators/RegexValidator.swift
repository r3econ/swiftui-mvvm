import Foundation

struct RegexValidator: Validator {

    init(rules: [RegexRule]) {
        self.rules = rules
    }

    private let rules: [RegexRule]

    func validate(_ value: Any) -> ValidationError? {
        guard let value = value as? String else {
            return ValidationError.custom(message: "Invalid value passed")
        }

        for rule in rules {
            guard value.firstMatch(of: rule.pattern) != nil else {
                return rule.error
            }
        }

        return nil
    }

}
