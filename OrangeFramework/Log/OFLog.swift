import Foundation

private class Box<T>: CustomStringConvertible, CustomDebugStringConvertible {
  let value: T
  init(_ value: T) {
    self.value = value
  }
  @objc
  var description: String {
    return String(value)
  }
  @objc
  var debugDescription: String {
    return String(reflecting: value)
  }
}

public extension OFLogger {
  
  public func log<T>(value: T?, flag: OFLogFlag, function: String = __FUNCTION__, file: String = __FILE__, line: UInt32 = __LINE__) {
    var logObject: AnyObject?
    if value is AnyObject {
      logObject = value as? AnyObject
    } else if value != nil {
      logObject = Box(value!)
    }
    __log(logObject, withFlag: flag, function: function, file: file, line: line)
  }
  
}

public extension OFLog {
  
  public class func error<T>(value: T?, function: String = __FUNCTION__, file: String = __FILE__, line: UInt32 = __LINE__) {
    for logger in loggers() {
      logger.log(value, flag: .Error, function: function, file: file, line: line)
    }
  }
  
  public class func warning<T>(value: T?, function: String = __FUNCTION__, file: String = __FILE__, line: UInt32 = __LINE__) {
    for logger in loggers() {
      logger.log(value, flag: .Warning, function: function, file: file, line: line)
    }
  }
  
  public class func info<T>(value: T?, function: String = __FUNCTION__, file: String = __FILE__, line: UInt32 = __LINE__) {
    for logger in loggers() {
      logger.log(value, flag: .Info, function: function, file: file, line: line)
    }
  }
  
  public class func debug<T>(value: T?, function: String = __FUNCTION__, file: String = __FILE__, line: UInt32 = __LINE__) {
    for logger in loggers() {
      logger.log(value, flag: .Debug, function: function, file: file, line: line)
    }
  }
  
  public class func verbose<T>(value: T?, function: String = __FUNCTION__, file: String = __FILE__, line: UInt32 = __LINE__) {
    for logger in loggers() {
      logger.log(value, flag: .Verbose, function: function, file: file, line: line)
    }
  }
  
}