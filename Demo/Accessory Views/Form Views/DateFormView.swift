import SwiftUI

struct DateFormView: View {

    let title: String
    @Binding var date: Date
    let allowedRange: ClosedRange<Date>
    let symbolName: String

    var body: some View {

        HStack {
            Image(systemName: symbolName)
            DatePicker(title,
                       selection: $date,
                       displayedComponents: [.date])
            .frame(maxWidth: .infinity,
                   alignment: .center)
        }
    }

}

#if !TESTING
struct DateFormView_Previews: PreviewProvider {

    static var dateRange: ClosedRange<Date> {
        let now = Date()
        let tenDaysAgo = Calendar.current.date(byAdding: .day,
                                               value: -10,
                                               to: now)!
        return tenDaysAgo...now
    }

    static var previews: some View {

        DateFormView(title: "Date",
                     date: .constant(Date()),
                     allowedRange: dateRange,
                     symbolName: "calendar")
            .previewLayout(.sizeThatFits)
            .padding()
    }

}
#endif
