import Foundation

public extension String {
  
  var length: Int { return self.characters.count }
  
  func matchRegex(pattern: String) -> Bool {
    return (self as NSString).matchRegex(pattern)
  }
  
  func firstMatchOfRegex(pattern: String) -> String? {
    return (self as NSString).firstMatchOfRegex(pattern)
  }
  
  func allMatchesOfRegex(pattern: String) -> [String] {
    return (self as NSString).allMatchesOfRegex(pattern)
  }
  
  func matchEmailString() -> Bool {
    return (self as NSString).matchEmailString()
  }
  
  func matchUrlString() -> Bool {
    return (self as NSString).matchUrlString()
  }
  
}