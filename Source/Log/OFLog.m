#import "OFLog.h"

static OFLogHandler _handler = nil;
static OFLogFormatter _formatter = nil;

void OFLogSetHandler(OFLogHandler handler) {
  _handler = [handler copy];
}

void OFLogSetFormatter(OFLogFormatter formatter) {
  _formatter = [formatter copy];
}

void OFLog(NSString * _Nullable message, OFLogFlag flag, NSString *function, NSString *file, unsigned int line) {
  __block NSString *formattedMessage = nil;
  OFLogLazyMessage lazyFormattedMessage = ^NSString * _Nonnull {
    if (!formattedMessage) {
      if (_formatter) {
        formattedMessage = _formatter(message, flag, function, file, line);
      } else {
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
    }
    return formattedMessage;
  };
  if (_handler && _handler(lazyFormattedMessage, flag)) {
    printf("%s\n", [lazyFormattedMessage() UTF8String]);
  }
}