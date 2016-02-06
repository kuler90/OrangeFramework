#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// localized string for current locale from .stringdict (firstly) and .strings files
NS_INLINE NSString * OFLocalized(NSString *formatOrKey, ...) NS_FORMAT_FUNCTION(1,2);
NSString * OFLocalized(NSString *formatOrKey, ...) {
  va_list args;
  va_start(args, formatOrKey);
  NSString *step1 = [[NSBundle mainBundle] localizedStringForKey:formatOrKey value:@"" table:nil];
  NSString *step2 = [[NSString alloc] initWithFormat:step1 locale:[NSLocale currentLocale] arguments:args];
  va_end(args);
  return step2;
}

NS_ASSUME_NONNULL_END
