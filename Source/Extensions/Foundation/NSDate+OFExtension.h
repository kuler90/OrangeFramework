#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (OFExtension)

+ (nullable instancetype)dateFromString:(NSString *)dateString format:(NSString *)format;
+ (nullable instancetype)dateFromString:(NSString *)dateString format:(NSString *)format timezone:(NSTimeZone *)timezone;
+ (nullable instancetype)dateFromComponents:(NSDateComponents *)components;

- (nullable instancetype)dateByModifyComponents:(void (^)(NSDateComponents *components))modifyBlock; // components with year, month, day, hour, minute, second, nanosecond, weekday, weekOfMonth, weekOfYear, timeZone
- (NSDateComponents *)components; // year, month, day, hour, minute, second, nanosecond, weekday, weekOfMonth, weekOfYear, timeZone

- (NSString *)dateStringWithFormat:(NSString *)format;
- (NSString *)dateStringWithFormat:(NSString *)format timezone:(NSTimeZone *)timezone;
- (NSString *)dateStringWithFormatTemplate:(NSString *)formatTemplate;
- (NSString *)dateStringWithFormatTemplate:(NSString *)formatTemplate timezone:(NSTimeZone *)timezone;

- (BOOL)isEqualToDate:(NSDate *)otherDate ignoreTime:(BOOL)ignoreTime;

@end

NS_ASSUME_NONNULL_END
