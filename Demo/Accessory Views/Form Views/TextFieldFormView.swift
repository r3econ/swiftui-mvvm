import SwiftUI

struct TextFieldFormView: View {

    @Binding var text: String
    let placeholder: String
    let symbolName: String
    let accessibilityLabel: String
    let keyboardType: UIKeyboardType
    let autocorrectionDisabled: Bool
    let autocapitalizationType: UITextAutocapitalizationType

    var body: some View {

        HStack {
            Image(systemName: symbolName)
            TextField(placeholder, text: $text)
                .frame(maxWidth: .infinity,
                       minHeight: 44.0,
                       alignment: .center)
                .keyboardType(keyboardType)
                .autocapitalization(autocapitalizationType)
                .autocorrectionDisabled(autocorrectionDisabled)
                .accessibilityLabel(accessibilityLabel)
        }
    }

}

#if !TESTING
struct TextFieldFormView_Previews: PreviewProvider {

    static var previews: some View {

        TextFieldFormView(text: .constant(""),
                          placeholder: "Email address",
                          symbolName: "mail",
                          accessibilityLabel: "",
                          keyboardType: .default,
                          autocorrectionDisabled: false,
                          autocapitalizationType: .none)
            .previewLayout(.sizeThatFits)
            .padding()
    }

}
#endif
