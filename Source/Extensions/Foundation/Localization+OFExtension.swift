import Foundation

public func OFLocalized(key: String) -> String {
  return NSBundle.mainBundle().localizedStringForKey(key, value: "", table: nil)
}

public func OFLocalizedWithFormat(formatKey: String, _ args: CVarArgType...) -> String {
  switch args.count { // temporary fix until I don't not know how to pass variadic args
  case 0: return String.localizedStringWithFormat(OFLocalized(formatKey))
  case 1: return String.localizedStringWithFormat(OFLocalized(formatKey), args[0])
  case 2: return String.localizedStringWithFormat(OFLocalized(formatKey), args[0], args[1])
  case 3: return String.localizedStringWithFormat(OFLocalized(formatKey), args[0], args[1], args[2])
  case 4: return String.localizedStringWithFormat(OFLocalized(formatKey), args[0], args[1], args[2], args[3])
  case 5: return String.localizedStringWithFormat(OFLocalized(formatKey), args[0], args[1], args[2], args[3], args[4])
  case 6: return String.localizedStringWithFormat(OFLocalized(formatKey), args[0], args[1], args[2], args[3], args[4], args[5])
  case 7: return String.localizedStringWithFormat(OFLocalized(formatKey), args[0], args[1], args[2], args[3], args[4], args[5], args[6])
  case 8: return String.localizedStringWithFormat(OFLocalized(formatKey), args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7])
  default: fatalError("Too much arguments")
  }
}