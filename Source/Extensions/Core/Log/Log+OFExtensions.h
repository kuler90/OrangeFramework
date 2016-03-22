#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, OFLogLevel)
{
  OFLogLevelDefault,
  OFLogLevelInfo,
  OFLogLevelWarning,
  OFLogLevelError
};

typedef NSString * _Nonnull (^OFLogLazyMessage)(void);
typedef BOOL (^OFLogHandler)(OFLogLazyMessage lazyFormattedMessage, NSString * _Nullable rawMessage, OFLogLevel level, NSString *function, NSString *file, unsigned int line);

FOUNDATION_EXPORT void __OFLog(NSString * _Nullable message, OFLogLevel level, NSString *function, NSString *file, unsigned int line);
FOUNDATION_EXPORT void OFLogSetup(OFLogHandler handler); // setup which message should print, by default print all in DEBUG and nothing otherwise

#define OFLog(object) __OFLog([object description], OFLogLevelDefault, [NSString stringWithUTF8String:__func__], [NSString stringWithUTF8String:__FILE__], __LINE__)
#define OFLogInfo(object) __OFLog([object description], OFLogLevelInfo, [NSString stringWithUTF8String:__func__], [NSString stringWithUTF8String:__FILE__], __LINE__)
#define OFLogWarning(object) __OFLog([object description], OFLogLevelWarning, [NSString stringWithUTF8String:__func__], [NSString stringWithUTF8String:__FILE__], __LINE__)
#define OFLogError(object) __OFLog([object description], OFLogLevelError, [NSString stringWithUTF8String:__func__], [NSString stringWithUTF8String:__FILE__], __LINE__)

#define OFLogF(format, ...) __OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogLevelDefault, [NSString stringWithUTF8String:__func__], [NSString stringWithUTF8String:__FILE__], __LINE__)
#define OFLogInfoF(format, ...) __OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogLevelInfo, [NSString stringWithUTF8String:__func__], [NSString stringWithUTF8String:__FILE__], __LINE__)
#define OFLogWarningF(format, ...) __OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogLevelWarning, [NSString stringWithUTF8String:__func__], [NSString stringWithUTF8String:__FILE__], __LINE__)
#define OFLogErrorF(format, ...) __OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogLevelError, [NSString stringWithUTF8String:__func__], [NSString stringWithUTF8String:__FILE__], __LINE__)

NS_ASSUME_NONNULL_END