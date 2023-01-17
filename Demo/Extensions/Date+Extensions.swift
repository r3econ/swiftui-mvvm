import Foundation

extension Date {

    init?(_ year: Int, _ month: Int, _ day: Int) {

        let calendar = Calendar.current
        guard let date = calendar.date(from: DateComponents(year: year,
                                                            month: month,
                                                            day: day)) else {
            return nil
        }

        self.init(timeInterval: 0, since: date)
    }

}
