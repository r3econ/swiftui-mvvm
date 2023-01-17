import SwiftUI

extension Color {

    init(_ hexColor: UInt32) {
        self.init(uiColor: .init(
            red: CGFloat(0xFF & (hexColor >> 0x10)) / 0xFF,
            green: CGFloat(0xFF & (hexColor >> 0x08)) / 0xFF,
            blue: CGFloat(0xFF & (hexColor >> 0x00)) / 0xFF,
            alpha: 1.0))
    }
}
