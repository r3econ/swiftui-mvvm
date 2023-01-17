import SwiftUI

struct BackgroundView: View {

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color(0xa8ff78),
            Color(0x78ffd6)]),
                       startPoint: .leading,
                       endPoint: .topTrailing)
        .edgesIgnoringSafeArea(.all)

    }
}

#if !TESTING
struct GradientBackgroundView_Previews: PreviewProvider {

    static var previews: some View {

        BackgroundView()
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
#endif
