import SwiftUI

struct DateOfBirthFormView: View {

    @Binding var date: Date
    let allowedRange: ClosedRange<Date>

    var body: some View {
        DateFormView(title: "Date of Birth",
                     date: $date,
                     allowedRange: allowedRange,
                     symbolName: "calendar")
    }

}

#if !TESTING
struct DateOfBirthFormView_Previews: PreviewProvider {

    static let dateRange = Date(1900, 1, 1)!...Date(2019, 12, 31)!

    static var previews: some View {

        DateOfBirthFormView(date: .constant(Date()),
                            allowedRange: dateRange)
            .previewLayout(.sizeThatFits)
            .padding()
    }

}
#endif
