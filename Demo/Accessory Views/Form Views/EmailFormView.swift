import SwiftUI

struct EmailFormView: View {

    @Binding var text: String

    var body: some View {
        TextFieldFormView(text: $text,
                          placeholder: "Email address",
                          symbolName: "square.and.pencil",
                          accessibilityLabel: "Email address text field",
                          keyboardType: .emailAddress,
                          autocorrectionDisabled: true,
                          autocapitalizationType: .none)
    }

}

#if !TESTING
struct EmailFormView_Previews: PreviewProvider {

    static var previews: some View {

        EmailFormView(text: .constant(""))
        .previewLayout(.sizeThatFits)
        .padding()
    }

}
#endif
