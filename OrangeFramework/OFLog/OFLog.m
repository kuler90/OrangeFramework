#import "OFLog.h"

@implementation OFLogger

+ (instancetype)consoleLoggerWithLogLevel:(OFLogLevel)logLevel {
  return [[OFLogger alloc] initWithLogLevel:logLevel printer:^(OFLogFlag flag, NSString * _Nonnull message) {
    printf("%s\n", [message UTF8String]);
  }];
}

- (instancetype)initWithLogLevel:(OFLogLevel)logLevel printer:(OFLogPrinter)printer formatter:(_Nullable OFLogFormatter)formatter {
  self = [super init];
  if (self) {
    self.logLevel = logLevel;
    self.printer = printer;
    self.formatter = formatter;
  }
  return self;
}

- (instancetype)initWithLogLevel:(OFLogLevel)logLevel printer:(OFLogPrinter)printer {
  return [self initWithLogLevel:logLevel printer:printer formatter:nil];
}

- (void)setFormatter:(OFLogFormatter)formatter {
  if (formatter) {
    _formatter = [formatter copy];
  } else {
    // set default formatter
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"ddMMyyyy HHmmssSSS" options:0 locale:nil];
    _formatter = [^NSString * _Nonnull(id  _Nullable object, OFLogFlag flag, NSString * _Nonnull function, NSString * _Nonnull file, unsigned int line) {
      NSString *currentTime = [dateFormatter stringFromDate:[NSDate date]];
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
      NSString *fileName = [file lastPathComponent];
      NSString *message = [object debugDescription];
      return [NSString stringWithFormat:@"%@ [%@] %@:%d (%@): %@", currentTime, flagString, fileName, line, function, message];
    } copy];
  }
}

- (void)log:(id)object withFlag:(OFLogFlag)flag function:(const char *)function file:(const char *)file line:(unsigned int)line {
  if ((NSInteger)flag <= (NSInteger)self.logLevel) {
    NSString *message = self.formatter(object, flag, [NSString stringWithUTF8String:function], [NSString stringWithUTF8String:file], line);
    self.printer(flag, message);
  }
}

@end

static NSMutableArray *loggers = nil;

@implementation OFLog

+ (void)initialize {
  static dispatch_once_t once;
  dispatch_once(&once, ^{
    loggers = [NSMutableArray new];
  });
}

+ (void)registerLogger:(OFLogger *)logger {
  [loggers addObject:logger];
}

+ (void)removeLogger:(OFLogger *)logger {
  [loggers removeObject:logger];
}

+ (NSArray<OFLogger *> *)loggers {
  return [loggers copy];
}

+ (void)log:(id)object withFlag:(OFLogFlag)flag function:(const char *)function file:(const char *)file line:(unsigned int)line {
  for (OFLogger *logger in loggers) {
    [logger log:object withFlag:flag function:function file:file line:line];
  }
}

@end