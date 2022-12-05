import Foundation

extension Date {
    public func minutesCount(from date: Date) -> Int {
        return abs(Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0)
    }

    public func daysCount(from date: Date) -> Int {
        return abs(Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0)
    }
}
