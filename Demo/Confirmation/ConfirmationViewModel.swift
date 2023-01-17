import Foundation

class ConfirmationViewModel: ObservableObject {

    private let userService: any UserServiceProtocol

    @Published var username = ""
    @Published var emailAddress = ""
    @Published var dateOfBirthText = ""

    init(userService: any UserServiceProtocol = UserService()) {
        self.userService = userService

        guard let user = userService.user else {
            return
        }

        username = user.name
        emailAddress = user.emailAddress
        dateOfBirthText = user.birthDate.formatted(date: .abbreviated,
                                                   time: .omitted)
    }

    func unregister() {

        userService.unregister()
    }

}
