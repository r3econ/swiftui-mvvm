import SwiftUI
import Combine

struct RegistrationView: View {

    @StateObject var viewModel: RegistrationViewModel

    init(viewModel: RegistrationViewModel = .init()) {

        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            BackgroundView()

            Form {
                VStack {
                    TitleFormView(text: "Register")
                        .accessibilityIdentifier("Register title")

                    UsernameFormView(text: $viewModel.username)
                    EmailFormView(text: $viewModel.emailAddress)
                    DateOfBirthFormView(date: $viewModel.dateOfBirth,
                                        allowedRange: viewModel.dateOfBirthRange)
                    Spacer(minLength: 15.0)

                    Button("Register") {
                        viewModel.register()
                    }
                    .accessibilityIdentifier("Register button")
                    .modifier(CustomRoundedStyle())
                    .disabled(!viewModel.isValid)
                    .opacity(viewModel.isValid ? 1 : 0.5)

                    Spacer(minLength: 10.0)

                    if !viewModel.isValid {
                        ErrorTextFormField(text: $viewModel.validationErrorMessage)
                            .transition(AnyTransition.viewSwapTransition)
                    }
                }
                .padding()
                .modifier(TranslucentListBackgroundStyle())
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#if !TESTING
struct RegistrationView_Previews: PreviewProvider {

    static let viewModel: RegistrationViewModel = {

        let viewModel = RegistrationViewModel()
        viewModel.username = "Bob Lazar"
        viewModel.emailAddress = "bob@lazar.com"
        viewModel.dateOfBirth = Date(1980, 10, 10)!
        viewModel.validationErrorMessage = "Incorrect email address"

        return viewModel
    }()

    static var previews: some View {
        RegistrationView(viewModel: viewModel)
    }
}
#endif
