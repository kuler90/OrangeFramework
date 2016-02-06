import Foundation

extension NSDate: Comparable {}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.isEqualToDate(rhs)
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.timeIntervalSince1970 < rhs.timeIntervalSince1970
}