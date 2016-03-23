#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (OFExtension)

+ (nullable instancetype)of_dateFromString:(NSString *)dateString format:(NSString *)format NS_SWIFT_NAME(init(of_dateString:format:));
+ (nullable instancetype)of_dateFromString:(NSString *)dateString format:(NSString *)format timezone:(NSTimeZone *)timezone NS_SWIFT_NAME(init(of_dateString:format:timezone:));
+ (nullable instancetype)of_dateFromComponents:(NSDateComponents *)components NS_SWIFT_NAME(init(of_components:));

- (nullable instancetype)of_dateByModifyComponents:(void (^)(NSDateComponents *components))modifyBlock; // components with year, month, day, hour, minute, second, nanosecond, weekday, weekOfMonth, weekOfYear, timeZone
- (NSDateComponents *)of_components; // year, month, day, hour, minute, second, nanosecond, weekday, weekOfMonth, weekOfYear, timeZone

- (NSString *)of_dateStringWithFormat:(NSString *)format;
- (NSString *)of_dateStringWithFormat:(NSString *)format timezone:(NSTimeZone *)timezone;
- (NSString *)of_dateStringWithFormatTemplate:(NSString *)formatTemplate;
- (NSString *)of_dateStringWithFormatTemplate:(NSString *)formatTemplate timezone:(NSTimeZone *)timezone;

- (BOOL)of_isEqualToDateIgnoringTime:(NSDate *)otherDate;

@end

NS_ASSUME_NONNULL_END
