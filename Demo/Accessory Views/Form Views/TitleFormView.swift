import SwiftUI

struct TitleFormView: View {

    let text: String

    var body: some View {
        Text(text)
            .font(.title)
    }

}

#if !TESTING
struct TitleFormView_Previews: PreviewProvider {

    static var previews: some View {

        TitleFormView(text: "Register")
        .previewLayout(.sizeThatFits)
        .padding()
    }

}
#endif
