import SwiftUI

struct UsernameFormView: View {

    @Binding var text: String

    var body: some View {
        TextFieldFormView(text: $text,
                          placeholder: "Name",
                          symbolName: "person",
                          accessibilityLabel: "Username text field",
                          keyboardType: .default,
                          autocorrectionDisabled: false,
                          autocapitalizationType: .words)
    }

}

#if !TESTING
struct UsernameFormView_Previews: PreviewProvider {

    static var previews: some View {

        UsernameFormView(text: .constant("Bob Lazar"))
            .previewLayout(.sizeThatFits)
            .padding()
    }

}
#endif
