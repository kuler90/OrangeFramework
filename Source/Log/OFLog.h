#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, OFLogLevel)
{
  OFLogLevelOff = -1,
  OFLogLevelError,
  OFLogLevelWarning,
  OFLogLevelInfo,
  OFLogLevelDebug,
  OFLogLevelVerbose,
  OFLogLevelAll
};

typedef NS_ENUM(NSInteger, OFLogFlag)
{
  OFLogFlagError,
  OFLogFlagWarning,
  OFLogFlagInfo,
  OFLogFlagDebug,
  OFLogFlagVerbose
};

#define OFLogError(format, ...) [OFLog log:[NSString stringWithFormat:format,##__VA_ARGS__] withFlag:OFLogFlagError function:__func__ file:__FILE__ line:__LINE__]
#define OFLogWarning(format,...) [OFLog log:[NSString stringWithFormat:format,##__VA_ARGS__] withFlag:OFLogFlagWarning function:__func__ file:__FILE__ line:__LINE__]
#define OFLogInfo(format, ...) [OFLog log:[NSString stringWithFormat:format,##__VA_ARGS__] withFlag:OFLogFlagInfo function:__func__ file:__FILE__ line:__LINE__]
#define OFLogDebug(format, ...) [OFLog log:[NSString stringWithFormat:format,##__VA_ARGS__] withFlag:OFLogFlagDebug function:__func__ file:__FILE__ line:__LINE__]
#define OFLogVerbose(format, ...) [OFLog log:[NSString stringWithFormat:format,##__VA_ARGS__] withFlag:OFLogFlagVerbose function:__func__ file:__FILE__ line:__LINE__]

#define OFLogErrorObject(object) [OFLog log:object withFlag:OFLogFlagError function:__func__ file:__FILE__ line:__LINE__]
#define OFLogWarningObject(object) [OFLog log:object withFlag:OFLogFlagWarning function:__func__ file:__FILE__ line:__LINE__]
#define OFLogInfoObject(object) [OFLog log:object withFlag:OFLogFlagInfo function:__func__ file:__FILE__ line:__LINE__]
#define OFLogDebugObject(object) [OFLog log:object withFlag:OFLogFlagDebug function:__func__ file:__FILE__ line:__LINE__]
#define OFLogVerboseObject(object) [OFLog log:object withFlag:OFLogFlagVerbose function:__func__ file:__FILE__ line:__LINE__]

NS_ASSUME_NONNULL_BEGIN

@interface OFLogger : NSObject

typedef void (^OFLogPrinter)(OFLogFlag flag, NSString *message);
typedef NSString * _Nonnull (^OFLogFormatter)(_Nullable id object, OFLogFlag flag, NSString *function, NSString *file, unsigned int line);

@property (nonatomic) OFLogLevel logLevel;
@property (nonatomic, copy) OFLogPrinter printer;
@property (nonatomic, copy, null_resettable) OFLogFormatter formatter;

+ (instancetype)consoleLoggerWithLogLevel:(OFLogLevel)logLevel NS_SWIFT_NAME(consoleLogger(logLevel:));

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithLogLevel:(OFLogLevel)logLevel printer:(OFLogPrinter)printer formatter:(nullable OFLogFormatter)formatter NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithLogLevel:(OFLogLevel)logLevel printer:(OFLogPrinter)printer;

- (void)log:(nullable id)object withFlag:(OFLogFlag)flag function:(const char *)function file:(const char *)file line:(unsigned int)line NS_REFINED_FOR_SWIFT;

@end

@interface OFLog : NSObject

+ (void)registerLogger:(OFLogger *)logger;
+ (void)removeLogger:(OFLogger *)logger;
+ (NSArray<OFLogger *> *)loggers;

+ (void)log:(nullable id)object withFlag:(OFLogFlag)flag function:(const char *)function file:(const char *)file line:(unsigned int)line NS_SWIFT_UNAVAILABLE("Use swift extension methods instead");

@end

NS_ASSUME_NONNULL_END