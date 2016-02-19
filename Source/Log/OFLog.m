#import "OFLog.h"

static OFLogHandler _handler = nil;
#ifdef DEBUG
static const BOOL _defaultHandlerResult = YES;
#else
static const BOOL _defaultHandlerResult = NO;
#endif

void OFLogSetHandler(OFLogHandler handler) {
  _handler = [handler copy];
}

void OFLog(NSString * _Nullable message, OFLogLevel level, NSString *function, NSString *file, unsigned int line) {
  __block NSString *formattedMessage = nil;
  OFLogLazyMessage lazyFormattedMessage = ^NSString * _Nonnull {
    if (!formattedMessage) {
      NSDateFormatter *dateFormatter = [NSDateFormatter new];
      dateFormatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"ddMMyyyy HHmmssSSS" options:0 locale:nil];
      NSString *timeString = [dateFormatter stringFromDate:[NSDate date]];
      NSString *levelString;
      switch (level) {
        case OFLogLevelError:
          levelString = @"ERROR";
          break;
        case OFLogLevelWarning:
          levelString = @"WARNING";
          break;
        case OFLogLevelDebug:
          levelString = @"DEBUG";
          break;
        case OFLogLevelInfo:
          levelString = @"INFO";
          break;
        case OFLogLevelVerbose:
          levelString = @"VERBOSE";
      }
      NSString *filename = [file lastPathComponent];
      formattedMessage = [NSString stringWithFormat:@"%@ [%@] %@:%d (%@): %@", timeString, levelString, filename, line, function, message];
    }
    return formattedMessage;
  };
  if ( (!_handler && _defaultHandlerResult) || (_handler && _handler(lazyFormattedMessage, message, level, function, file, line)) ) {
    printf("%s\n", [lazyFormattedMessage() UTF8String]);
  }
}