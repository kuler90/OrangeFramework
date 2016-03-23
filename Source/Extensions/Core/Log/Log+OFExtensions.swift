import Foundation

/// setup which message should print, by default print all in DEBUG and nothing otherwise
public func of_printSetup(handler: OFLogHandler) {
  OFLogSetup(handler)
}

public func of_print(value: Any?, level: OFLogLevel = .Default, _ function: String = #function, _ file: String = #file, _ line: UInt32 = #line) {
  __OFLog(value != nil ? String(value!) : nil, level, function, file, line)
}


extension OFLogLevel: Comparable {}

public func ==(lhs: OFLogLevel, rhs: OFLogLevel) -> Bool {
  return lhs.rawValue == rhs.rawValue
}

public func <(lhs: OFLogLevel, rhs: OFLogLevel) -> Bool {
  return lhs.rawValue < rhs.rawValue
}