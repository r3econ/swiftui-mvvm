import Foundation

struct DateValidator: Validator {

    init(range: ClosedRange<Date>) {
        self.range = range
    }

    private let range: ClosedRange<Date>

    func validate(_ value: Any) -> ValidationError? {
        guard let date = value as? Date else {

            return ValidationError.custom(
                message: "Invalid value passed")
        }

        guard range.contains(date) else {
            return ValidationError.custom(
                message: "Incorrect date. Valid range: \(range.lowerBound.formatted(date: .abbreviated, time: .omitted)) - \(range.upperBound.formatted(date: .abbreviated, time: .omitted))")
        }

        return nil
    }
}
