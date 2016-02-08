#import "OFLog.h"

static BOOL _enabled = YES;
static OFLogHandler _handler = nil;
static OFLogFormatter _formatter = nil;

void OFLogSetEnabled(BOOL enabled) {
  _enabled = enabled;
}

void OFLogSetHandler(OFLogHandler handler) {
  _handler = [handler copy];
}

void OFLogSetFormatter(OFLogFormatter formatter) {
  _formatter = [formatter copy];
}

void OFLog(NSString * _Nullable message, OFLogFlag flag, NSString *function, NSString *file, unsigned int line) {
  if (!_enabled) {
    return;
  }
  // setup formatter
  OFLogFormatter currentFormatter;
  if (_formatter) {
    currentFormatter = _formatter;
  } else {
    // create default formatter
    static OFLogFormatter defaultFormatter;
    if (!defaultFormatter) {
      defaultFormatter = [^NSString * _Nonnull(NSString * _Nullable _rawMessage, OFLogFlag _flag, NSString * _Nonnull _function, NSString * _Nonnull _file, unsigned int _line) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"ddMMyyyy HHmmssSSS" options:0 locale:nil];
        NSString *timeString = [dateFormatter stringFromDate:[NSDate date]];
        NSString *flagString;
        switch (_flag) {
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
        NSString *filename = [_file lastPathComponent];
        return [NSString stringWithFormat:@"%@ [%@] %@:%d (%@): %@", timeString, flagString, filename, _line, _function, _rawMessage];
      } copy];
    }
    currentFormatter = defaultFormatter;
  }
  // process handler
  if (!_handler) {
    NSString *formattedMessage = currentFormatter(message, flag, function, file, line);
    printf("%s\n", [formattedMessage UTF8String]);
  } else {
    // create lazy message
    __block NSString *formattedMessage = nil;
    OFLogLazyMessage lazyFormattedMessage = ^NSString * _Nonnull {
      if (!formattedMessage) {
        formattedMessage = currentFormatter(message, flag, function, file, line);
      }
      return formattedMessage;
    };
    if (_handler(lazyFormattedMessage, flag)) {
      printf("%s\n", [lazyFormattedMessage() UTF8String]);
    }
  }
}