import SwiftUI

struct ConfirmationView: View {

    @StateObject var viewModel: ConfirmationViewModel

    init(viewModel: ConfirmationViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {

        ZStack {
            BackgroundView()

            VStack {
                TitleFormView(text: "Thank you for registering")
                    .accessibilityIdentifier("Confirmation title")
                    .padding()
                Text(viewModel.username)
                    .accessibilityIdentifier("Username text label")
                Text(viewModel.emailAddress)
                    .accessibilityIdentifier("Email address text label")
                Text(viewModel.dateOfBirthText)
                    .accessibilityIdentifier("Date of birth text label")

                Button("Unregister") {
                    viewModel.unregister()
                }
                .accessibilityIdentifier("Unregister button")
                .modifier(CustomRoundedStyle())
                .padding()
            }
            .padding()
            .modifier(TranslucentRoundedBackgroundStyle())
        }
    }
}

#if !TESTING
struct ConfirmationView_Previews: PreviewProvider {

    static let viewModel: ConfirmationViewModel = {

        let viewModel = ConfirmationViewModel()
        viewModel.username = "Bob Lazar"
        viewModel.emailAddress = "bob@lazar.com"
        viewModel.dateOfBirthText = Date().formatted(date: .abbreviated,
                                                     time: .omitted)
        return viewModel
    }()

    static var previews: some View {

        ConfirmationView(viewModel: viewModel)
    }
}
#endif
