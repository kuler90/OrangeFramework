#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, OFLogFlag)
{
  OFLogFlagError,
  OFLogFlagWarning,
  OFLogFlagInfo,
  OFLogFlagDebug,
  OFLogFlagVerbose
};

typedef NSString * _Nonnull (^OFLogLazyMessage)(void);
typedef BOOL (^OFLogHandler)(OFLogLazyMessage lazyMessage, OFLogFlag flag);
typedef NSString * _Nonnull (^OFLogFormatter)(NSString * _Nullable rawMessage, OFLogFlag flag, NSString *function, NSString *file, unsigned int line);

FOUNDATION_EXPORT void OFLogSetHandler(OFLogHandler handler); // set which message should be print, by default print all
FOUNDATION_EXPORT void OFLogSetFormatter(OFLogFormatter formatter);
FOUNDATION_EXPORT void OFLog(NSString * _Nullable message, OFLogFlag flag, NSString *function, NSString *file, unsigned int line);

#define OFLogError(format, ...) OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogFlagError, __func__, __FILE__, __LINE__)
#define OFLogWarning(format,...) OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogFlagWarning, __func__, __FILE__, __LINE__)
#define OFLogInfo(format, ...) OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogFlagInfo, __func__, __FILE__, __LINE__)
#define OFLogDebug(format, ...) OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogFlagDebug, __func__, __FILE__, __LINE__)
#define OFLogVerbose(format, ...) OFLog([NSString stringWithFormat:format,##__VA_ARGS__], OFLogFlagVerbose, __func__, __FILE__, __LINE__)

#define OFLogErrorObject(object) OFLog([object debugDescription], OFLogFlagError, __func__, __FILE__, __LINE__)
#define OFLogWarningObject(object) OFLog([object debugDescription], OFLogFlagWarning, __func__, __FILE__, __LINE__)
#define OFLogInfoObject(object) OFLog([object debugDescription], OFLogFlagInfo, __func__, __FILE__, __LINE__)
#define OFLogDebugObject(object) OFLog([object debugDescription], OFLogFlagDebug, __func__, __FILE__, __LINE__)
#define OFLogVerboseObject(object) OFLog([object debugDescription], OFLogFlagVerbose, __func__, __FILE__, __LINE__)

NS_ASSUME_NONNULL_END