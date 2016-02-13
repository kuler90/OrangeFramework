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

void OFLog(NSString * _Nullable message, OFLogFlag flag, NSString *function, NSString *file, unsigned int line) {
  __block NSString *formattedMessage = nil;
  OFLogLazyMessage lazyFormattedMessage = ^NSString * _Nonnull {
    if (!formattedMessage) {
      NSDateFormatter *dateFormatter = [NSDateFormatter new];
      dateFormatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"ddMMyyyy HHmmssSSS" options:0 locale:nil];
      NSString *timeString = [dateFormatter stringFromDate:[NSDate date]];
      NSString *flagString;
      switch (flag) {
        case OFLogFlagError:
          flagString = @"ERROR";
          break;
        case OFLogFlagWarning:
          flagString = @"WARNING";
          break;
        case OFLogFlagDebug:
          flagString = @"DEBUG";
          break;
        case OFLogFlagInfo:
          flagString = @"INFO";
          break;
        case OFLogFlagVerbose:
          flagString = @"VERBOSE";
          break;
      }
      NSString *filename = [file lastPathComponent];
      formattedMessage = [NSString stringWithFormat:@"%@ [%@] %@:%d (%@): %@", timeString, flagString, filename, line, function, message];
    }
    return formattedMessage;
  };
  if ( (!_handler && _defaultHandlerResult) || (_handler && _handler(lazyFormattedMessage, message, flag, function, file, line)) ) {
    printf("%s\n", [lazyFormattedMessage() UTF8String]);
  }
}