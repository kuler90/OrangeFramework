#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, OFLogLevel)
{
  OFLogLevelError,
  OFLogLevelWarning,
  OFLogLevelInfo,
  OFLogLevelDebug,
  OFLogLevelVerbose
};

typedef NSString * _Nonnull (^OFLogLazyMessage)(void);
typedef BOOL (^OFLogHandler)(OFLogLazyMessage lazyFormattedMessage, NSString * _Nullable rawMessage, OFLogLevel level, NSString *function, NSString *file, unsigned int line);

FOUNDATION_EXPORT void OFLog(NSString * _Nullable message, OFLogLevel level, NSString *function, NSString *file, unsigned int line);
FOUNDATION_EXPORT void OFLogSetHandler(OFLogHandler _Nullable handler); // log handler, decide which message should print, by default print all in DEBUG and nothing otherwise

#define OFLogError(format, ...) OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogLevelError, __func__, __FILE__, __LINE__)
#define OFLogWarning(format,...) OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogLevelWarning, __func__, __FILE__, __LINE__)
#define OFLogInfo(format, ...) OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogLevelInfo, __func__, __FILE__, __LINE__)
#define OFLogDebug(format, ...) OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogLevelDebug, __func__, __FILE__, __LINE__)
#define OFLogVerbose(format, ...) OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogLevelVerbose, __func__, __FILE__, __LINE__)

#define OFLogErrorObject(object) OFLog([object description], OFLogLevelError, __func__, __FILE__, __LINE__)
#define OFLogWarningObject(object) OFLog([object description], OFLogLevelWarning, __func__, __FILE__, __LINE__)
#define OFLogInfoObject(object) OFLog([object description], OFLogLevelInfo, __func__, __FILE__, __LINE__)
#define OFLogDebugObject(object) OFLog([object description], OFLogLevelDebug, __func__, __FILE__, __LINE__)
#define OFLogVerboseObject(object) OFLog([object description], OFLogLevelVerbose, __func__, __FILE__, __LINE__)

NS_ASSUME_NONNULL_END