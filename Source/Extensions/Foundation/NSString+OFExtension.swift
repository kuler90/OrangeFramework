import Foundation

public extension String {
  
  // MARK: - To Number
  
  public func toInt() -> Int? {
    return NSNumberFormatter().numberFromString(self)?.integerValue
  }
  
  public func toDouble() -> Double? {
    return NSNumberFormatter().numberFromString(self)?.doubleValue
  }
  
  // MARK: - Reading Time
  
  public func readingTime(speed speed: UInt = 250) -> NSTimeInterval { // speed = words per minute. default speed = 250
    return (self as NSString).readingTimeWithSpeed(speed)
  }
  
  // MARK: - Regex
  
  public func matchRegex(pattern: String) -> Bool {
    return (self as NSString).matchRegex(pattern)
  }
  
  public func firstMatchOfRegex(pattern: String) -> String? {
    return (self as NSString).firstMatchOfRegex(pattern)
  }
  
  public func allMatchesOfRegex(pattern: String) -> [String] {
    return (self as NSString).allMatchesOfRegex(pattern)
  }
  
  public func matchEmailString() -> Bool {
    return (self as NSString).matchEmailString()
  }
  
  public func matchUrlString() -> Bool {
    return (self as NSString).matchUrlString()
  }
  
}