import Foundation

/// localized string for current locale from .stringdict (firstly) and .strings files
public func OFLocalized(formatOrKey: String, _ args: CVarArgType...) -> String {
  return formatOrKey.of_localized()
}

public extension String {
  
  /// localized string for current locale from .stringdict (firstly) and .strings files
  public func of_localized(args: CVarArgType...) -> String {
    let step1 = NSBundle.mainBundle().localizedStringForKey(self, value: "", table: nil)
    let step2 = String(format: step1, locale: NSLocale.currentLocale(), arguments: args)
    return step2
  }
  
}