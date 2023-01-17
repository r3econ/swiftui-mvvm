import SwiftUI

struct TranslucentListBackgroundStyle: ViewModifier {

    func body(content: Content) -> some View {
        return content
            .listRowBackground(Color.clear)
            .padding()
            .modifier(TranslucentRoundedBackgroundStyle())
    }
}

struct TranslucentRoundedBackgroundStyle: ViewModifier {

    func body(content: Content) -> some View {
        return content
            .background(.regularMaterial)
            .mask {
                RoundedRectangle(cornerRadius: 20)
            }
    }
}
