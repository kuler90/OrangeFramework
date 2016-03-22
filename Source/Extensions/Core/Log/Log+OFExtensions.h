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

#define OFLog(objectOrFormat, ...) __OFLog(objectOrFormat ? [NSString stringWithFormat:[objectOrFormat description],##__VA_ARGS__] : nil, OFLogLevelDefault, __func__, __FILE__, __LINE__)
#define OFLogInfo(objectOrFormat, ...) __OFLog(objectOrFormat ? [NSString stringWithFormat:[objectOrFormat description],##__VA_ARGS__] : nil, OFLogLevelInfo, __func__, __FILE__, __LINE__)
#define OFLogWarning(objectOrFormat,...) __OFLog(objectOrFormat ? [NSString stringWithFormat:[objectOrFormat description],##__VA_ARGS__] : nil, OFLogLevelWarning, __func__, __FILE__, __LINE__)
#define OFLogError(objectOrFormat, ...) __OFLog(objectOrFormat ? [NSString stringWithFormat:[objectOrFormat description],##__VA_ARGS__] : nil, OFLogLevelError, __func__, __FILE__, __LINE__)

NS_ASSUME_NONNULL_END