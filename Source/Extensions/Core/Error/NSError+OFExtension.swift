import Foundation

public extension NSError {
  
  public convenience init<T>(of_domainObject: T, code: Int = 0, description: String) {
    self.init(domain: String(reflecting: T.self), code: code, userInfo: [NSLocalizedDescriptionKey: description])
  }
  
}