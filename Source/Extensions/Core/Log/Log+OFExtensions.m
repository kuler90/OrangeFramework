#import "Log+OFExtensions.h"

static OFLogHandler _handler = nil;
#ifdef DEBUG
static const BOOL _defaultHandlerResult = YES;
#else
static const BOOL _defaultHandlerResult = NO;
#endif

void OFLogSetup(OFLogHandler handler) {
  _handler = [handler copy];
}

void __OFLog(NSString * _Nullable message, OFLogLevel level, NSString *function, NSString *file, unsigned int line) {
  if (!_handler && !_defaultHandlerResult) {
    return;
  }
  __block NSString *formattedMessage = nil;
  OFLogLazyMessage lazyFormattedMessage = ^NSString * _Nonnull {
    if (!formattedMessage) {
      NSDateFormatter *dateFormatter = [NSDateFormatter new];
      dateFormatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"ddMMyyyy HHmmssSSS" options:0 locale:nil];
      NSString *timeString = [dateFormatter stringFromDate:[NSDate date]];
      NSString *levelString;
      switch (level) {
        case OFLogLevelDefault:
          levelString = @"";
          break;
        case OFLogLevelInfo:
          levelString = @" [INFO]";
          break;
        case OFLogLevelWarning:
          levelString = @" [WARNING]";
          break;
        case OFLogLevelError:
          levelString = @" [ERROR]";
      }
      NSString *filename = [file lastPathComponent];
      formattedMessage = [NSString stringWithFormat:@"%@%@ %@:%d (%@): %@", timeString, levelString, filename, line, function, message];
    }
    return formattedMessage;
  };
  if (!_handler || (_handler && _handler(lazyFormattedMessage, message, level, function, file, line))) {
    printf("%s\n", [lazyFormattedMessage() UTF8String]);
  }
}