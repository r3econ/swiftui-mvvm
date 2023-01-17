import SwiftUI

struct CustomRoundedStyle: ViewModifier {

    func body(content: Content) -> some View {
        return content
            .frame(
                   minHeight: 44.0,
                   alignment: .center)
            .buttonStyle(.borderedProminent)
    }
}
