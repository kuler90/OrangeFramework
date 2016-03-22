import Foundation

public typealias LogLevel = OFLogLevel
public typealias LogHandler = ((lazyFormattedMessage: () -> String, rawMessage: String?, level: LogLevel, function: String, file: String, line: UInt32) -> Bool)

public class Log {
  
  /// log handler, decide which message should print, by default print all in DEBUG and nothing otherwise
  public class func setHandler(handler: LogHandler?) {
    OFLogSetHandler(handler)
  }
  
  public class func error(value: Any?, _ function: String = #function, _ file: String = #file, _ line: UInt32 = #line) {
    OFLog("\(value)", LogLevel.Error, function, file, line)
  }
  
  public class func warning(value: Any?, _ function: String = #function, _ file: String = #file, _ line: UInt32 = #line) {
    OFLog("\(value)", LogLevel.Warning, function, file, line)
  }
  
  public class func info(value: Any?, _ function: String = #function, _ file: String = #file, _ line: UInt32 = #line) {
    OFLog("\(value)", LogLevel.Info, function, file, line)
  }
  
  public class func debug(value: Any?, _ function: String = #function, _ file: String = #file, _ line: UInt32 = #line) {
    OFLog("\(value)", LogLevel.Debug, function, file, line)
  }
  
  public class func verbose(value: Any?, _ function: String = #function, _ file: String = #file, _ line: UInt32 = #line) {
    OFLog("\(value)", LogLevel.Verbose, function, file, line)
  }
  
}


extension LogLevel: Comparable {}

public func ==(lhs: LogLevel, rhs: LogLevel) -> Bool {
  return lhs.rawValue == rhs.rawValue
}

public func <(lhs: LogLevel, rhs: LogLevel) -> Bool {
  return lhs.rawValue < rhs.rawValue
}