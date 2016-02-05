#import "NSDate+OFExtension.h"

@implementation NSDate (OFExtension)

+ (instancetype)dateFromString:(NSString *)dateString format:(NSString *)format {
  return [self dateFromString:dateString format:format timezone:[NSTimeZone timeZoneWithName:@"UTC"]];
}

+ (instancetype)dateFromString:(NSString *)dateString format:(NSString *)format timezone:(NSTimeZone *)timezone {
  NSDateFormatter *dateFormatter = [NSDateFormatter new];
  dateFormatter.dateFormat = format;
  dateFormatter.timeZone = timezone;
  return [dateFormatter dateFromString:dateString];
}

+ (instancetype)dateFromComponents:(NSDateComponents *)components {
  return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (instancetype)dateByModifyComponents:(void (^)(NSDateComponents *components))modifyBlock {
  NSDateComponents *selfComponents = [self components];
  modifyBlock(selfComponents);
  return [[self class] dateFromComponents:selfComponents];
}

- (NSDateComponents *)components {
  NSCalendarUnit unitFlags = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitNanosecond | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitTimeZone);
  return [[NSCalendar currentCalendar] components:unitFlags fromDate:self];
}

- (NSString *)dateStringWithFormat:(NSString *)format {
  return [self dateStringWithFormat:format timezone:[NSTimeZone defaultTimeZone]];
}

- (NSString *)dateStringWithFormat:(NSString *)format timezone:(NSTimeZone *)timezone {
  NSDateFormatter *dateFormatter = [NSDateFormatter new];
  dateFormatter.dateFormat = format;
  dateFormatter.timeZone = timezone;
  return [dateFormatter stringFromDate:self];
}

- (NSString *)dateStringWithFormatTemplate:(NSString *)formatTemplate {
  return [self dateStringWithFormatTemplate:formatTemplate timezone:[NSTimeZone defaultTimeZone]];
}

- (NSString *)dateStringWithFormatTemplate:(NSString *)formatTemplate timezone:(NSTimeZone *)timezone {
  return [self dateStringWithFormat:[NSDateFormatter dateFormatFromTemplate:formatTemplate options:0 locale:nil] timezone:timezone];
}

- (BOOL)isEqualToDate:(NSDate *)otherDate ignoreTime:(BOOL)ignoreTime {
  if (ignoreTime) {
    NSDateComponents *comp1 = [self components];
    NSDateComponents *comp2 = [otherDate components];
    return ((comp1.year == comp2.year) && (comp1.month == comp2.month) && (comp1.day == comp2.day));
  } else {
    return [self isEqualToDate:otherDate];
  }
}

@end
