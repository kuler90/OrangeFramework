import Foundation

public extension String {
  
  // MARK: - To Number
  
  public func of_toInt() -> Int? {
    return NSNumberFormatter().numberFromString(self)?.integerValue
  }
  
  public func of_toDouble() -> Double? {
    return NSNumberFormatter().numberFromString(self)?.doubleValue
  }
  
  // MARK: - Reading Time
  
  // speed = words per minute. default speed is 200
  public func of_readingTime(speed speed: UInt = 200) -> NSTimeInterval {
    return (self as NSString).of_readingTimeWithSpeed(speed)
  }
  
  // MARK: - Regex
  
  public func of_matchRegex(pattern: String) -> Bool {
    return (self as NSString).of_matchRegex(pattern)
  }
  
  public func of_firstMatchOfRegex(pattern: String) -> String? {
    return (self as NSString).of_firstMatchOfRegex(pattern)
  }
  
  public func of_allMatchesOfRegex(pattern: String) -> [String] {
    return (self as NSString).of_allMatchesOfRegex(pattern)
  }
  
  public func of_matchEmailString() -> Bool {
    return (self as NSString).of_matchEmailString()
  }
  
  public func of_matchUrlString() -> Bool {
    return (self as NSString).of_matchUrlString()
  }
  
}