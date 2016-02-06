#import "NSDate+OFExtension.h"

@implementation NSDate (OFExtension)

+ (instancetype)of_dateFromString:(NSString *)dateString format:(NSString *)format {
  return [self of_dateFromString:dateString format:format timezone:[NSTimeZone timeZoneWithName:@"UTC"]];
}

+ (instancetype)of_dateFromString:(NSString *)dateString format:(NSString *)format timezone:(NSTimeZone *)timezone {
  NSDateFormatter *dateFormatter = [NSDateFormatter new];
  dateFormatter.dateFormat = format;
  dateFormatter.timeZone = timezone;
  return [dateFormatter dateFromString:dateString];
}

+ (instancetype)of_dateFromComponents:(NSDateComponents *)components {
  return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (instancetype)of_dateByModifyComponents:(void (^)(NSDateComponents *components))modifyBlock {
  NSDateComponents *selfComponents = [self of_components];
  modifyBlock(selfComponents);
  return [[self class] of_dateFromComponents:selfComponents];
}

- (NSDateComponents *)of_components {
  NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitNanosecond | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitTimeZone;
  return [[NSCalendar currentCalendar] components:unitFlags fromDate:self];
}

- (NSString *)of_dateStringWithFormat:(NSString *)format {
  return [self of_dateStringWithFormat:format timezone:[NSTimeZone defaultTimeZone]];
}

- (NSString *)of_dateStringWithFormat:(NSString *)format timezone:(NSTimeZone *)timezone {
  NSDateFormatter *dateFormatter = [NSDateFormatter new];
  dateFormatter.dateFormat = format;
  dateFormatter.timeZone = timezone;
  return [dateFormatter stringFromDate:self];
}

- (NSString *)of_dateStringWithFormatTemplate:(NSString *)formatTemplate {
  return [self of_dateStringWithFormatTemplate:formatTemplate timezone:[NSTimeZone defaultTimeZone]];
}

- (NSString *)of_dateStringWithFormatTemplate:(NSString *)formatTemplate timezone:(NSTimeZone *)timezone {
  return [self of_dateStringWithFormat:[NSDateFormatter dateFormatFromTemplate:formatTemplate options:0 locale:nil] timezone:timezone];
}

- (BOOL)of_isEqualToDateIgnoringTime:(NSDate *)otherDate {
  NSDateComponents *comp1 = [self of_components];
  NSDateComponents *comp2 = [otherDate of_components];
  return ((comp1.year == comp2.year) && (comp1.month == comp2.month) && (comp1.day == comp2.day));
}

@end
