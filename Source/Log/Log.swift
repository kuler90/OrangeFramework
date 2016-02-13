import Foundation

public typealias LogFlag = OFLogFlag
public typealias LogHandler = ((lazyFormattedMessage: () -> String, rawMessage: String?, flag: LogFlag, function: String, file: String, line: UInt32) -> Bool)

public class Log {
  
  /// set which message should be print in console, default handler return true when DEBUG preprocessor symbol defined and false otherwise
  public class func setHandler(handler: LogHandler?) {
    OFLogSetHandler(handler)
  }
  
  public class func error(value: Any?, _ function: String = __FUNCTION__, _ file: String = __FILE__, _ line: UInt32 = __LINE__) {
    let message: String? = (value == nil) ? nil : String(reflecting: value!)
    OFLog(message, .Error, function, file, line)
  }
  
  public class func warning(value: Any?, _ function: String = __FUNCTION__, _ file: String = __FILE__, _ line: UInt32 = __LINE__) {
    let message: String? = (value == nil) ? nil : String(reflecting: value!)
    OFLog(message, .Warning, function, file, line)
  }
  
  public class func info(value: Any?, _ function: String = __FUNCTION__, _ file: String = __FILE__, _ line: UInt32 = __LINE__) {
    let message: String? = (value == nil) ? nil : String(reflecting: value!)
    OFLog(message, .Info, function, file, line)
  }
  
  public class func debug(value: Any?, _ function: String = __FUNCTION__, _ file: String = __FILE__, _ line: UInt32 = __LINE__) {
    let message: String? = (value == nil) ? nil : String(reflecting: value!)
    OFLog(message, .Debug, function, file, line)
  }
  
  public class func verbose(value: Any?, _ function: String = __FUNCTION__, _ file: String = __FILE__, _ line: UInt32 = __LINE__) {
    let message: String? = (value == nil) ? nil : String(reflecting: value!)
    OFLog(message, .Verbose, function, file, line)
  }
  
}