import Foundation

extension Date {
    public func minutesCount(from date: Date) -> Int {
        return abs(Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0)
    }

    public func daysCount(from date: Date) -> Int {
        return abs(Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0)
    }
}

extension Date {
    /// Returns a Date with the specified amount of components added to the one it is called with
    public func add(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date? {
        let components = DateComponents(year: years, month: months, day: days, hour: hours, minute: minutes, second: seconds)
        return Calendar.current.date(byAdding: components, to: self)
    }

    /// Returns a Date with the specified amount of components subtracted from the one it is called with
    public func subtract(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date? {
        return add(years: -years, months: -months, days: -days, hours: -hours, minutes: -minutes, seconds: -seconds)
    }
}
