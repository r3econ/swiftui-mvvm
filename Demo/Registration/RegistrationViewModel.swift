import Foundation
import Combine

class RegistrationViewModel: ObservableObject {

    @Published var username = ""
    @Published var emailAddress = ""
    @Published var dateOfBirth = Date(1980, 10, 10)!

    @Published var isValid = false
    @Published var validationErrorMessage = ""
    @Published private var validationErrors = [ValidationError]()

    private var userService: any UserServiceProtocol
    private let emailValidator = RegexValidator(rules: [RegexRule.emailAddressRule])
    private let usernameValidator = RegexValidator(rules: [RegexRule.usernameRule])
    private lazy var dateOfBirthValidator = DateValidator(range: dateOfBirthRange)
    private var subscribers: Set<AnyCancellable> = []

    init(userService: any UserServiceProtocol = UserService()) {

        self.userService = userService
        configureValidation()
    }

    // Allowed range: Jan 1, 1900 - December 31, 2019
    let dateOfBirthRange = Date(1900, 1, 1)!...Date(2019, 12, 31)!

    func register() {

        guard isValid else {
            return
        }

        let user = User(name: username,
                        emailAddress: emailAddress,
                        birthDate: dateOfBirth)

        userService.register(user)
    }

    func createConfirmationViewModel() -> ConfirmationViewModel {

        return ConfirmationViewModel(userService: userService)
    }

    private func configureValidation() {

        // Observe values in the registration form and validate them
        Publishers.CombineLatest3($username, $emailAddress, $dateOfBirth)
            .map { [weak self] username, emailAddress, dateOfBirth in

                // Get the validations errors, if any
                let errors = [
                    self?.usernameValidator.validate(username),
                    self?.emailValidator.validate(emailAddress),
                    self?.dateOfBirthValidator.validate(dateOfBirth)
                ].compactMap { $0 }

                return errors
            }
            .assign(to: &$validationErrors)

        // Transform validation errors into information that can be used in the view
        $validationErrors.sink { errors in

            if errors.isEmpty {
                self.isValid = true
                self.validationErrorMessage = ""
            } else {
                self.isValid = false
                self.validationErrorMessage = errors
                    .map({ $0.errorDescription })
                    .joined(separator: "\n")
            }
        }.store(in: &subscribers)
    }
}
