import Foundation

public enum LogFlag: Int {
  case Error, Warning, Info, Debug, Verbose
}

public typealias LogHandler = ((lazyMessage: () -> String, flag: LogFlag) -> Bool)
public typealias LogFormatter = ((rawMessage: String?, flag: LogFlag, function: String, file: String, line: UInt32) -> String)

public class Log {
  
  /// default is true
  public static var enabled: Bool = true {
    didSet {
      OFLogSetEnabled(enabled)
    }
  }
  
  /// set which message should be print, by default print all
  public class func setHandler(handler: LogHandler) {
    OFLogSetHandler { handler(lazyMessage: $0, flag: LogFlag(rawValue: $1.rawValue)!) }
  }
  
  public class func setFormatter(formatter: LogFormatter) {
    OFLogSetFormatter { formatter(rawMessage: $0, flag: LogFlag(rawValue: $1.rawValue)!, function: $2, file: $3, line: $4) }
  }
  
  public class func error<T>(value: T?, function: String = __FUNCTION__, file: String = __FILE__, line: UInt32 = __LINE__) {
    let message: String? = (value == nil) ? nil : String(reflecting: value!)
    OFLog(message, .Error, function, file, line)
  }
  
  public class func warning<T>(value: T?, function: String = __FUNCTION__, file: String = __FILE__, line: UInt32 = __LINE__) {
    let message: String? = (value == nil) ? nil : String(reflecting: value!)
    OFLog(message, .Warning, function, file, line)
  }
  
  public class func info<T>(value: T?, function: String = __FUNCTION__, file: String = __FILE__, line: UInt32 = __LINE__) {
    let message: String? = (value == nil) ? nil : String(reflecting: value!)
    OFLog(message, .Info, function, file, line)
  }
  
  public class func debug<T>(value: T?, function: String = __FUNCTION__, file: String = __FILE__, line: UInt32 = __LINE__) {
    let message: String? = (value == nil) ? nil : String(reflecting: value!)
    OFLog(message, .Debug, function, file, line)
  }
  
  public class func verbose<T>(value: T?, function: String = __FUNCTION__, file: String = __FILE__, line: UInt32 = __LINE__) {
    let message: String? = (value == nil) ? nil : String(reflecting: value!)
    OFLog(message, .Verbose, function, file, line)
  }
  
}