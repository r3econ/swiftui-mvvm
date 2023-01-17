import SwiftUI

struct ErrorTextFormField: View {

    @Binding var text: String

    var body: some View {
        Text(text)
            .font(.caption)
            .foregroundColor(Color.red)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .accessibilityLabel("Errors text label")
    }

}

#if !TESTING
struct ErrorTextFormField_Previews: PreviewProvider {

    static var previews: some View {

        ErrorTextFormField(text: .constant("Incorrect email address"))
            .previewLayout(.sizeThatFits)
            .padding()
    }

}
#endif
