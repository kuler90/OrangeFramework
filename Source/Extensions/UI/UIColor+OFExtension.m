#import "UIColor+OFExtension.h"

@implementation UIColor (OFExtension)

+ (instancetype)of_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue {
  return [self of_colorWithRed:red green:green blue:blue alpha:1.0f];
}

+ (instancetype)of_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha {
  return [self colorWithRed:red/256.0f green:green/256.0f blue:blue/256.0f alpha:alpha];
}

+ (instancetype)of_colorWithHexString:(NSString *)hexString {
  return [self of_colorWithHexString:hexString alpha:1.0f];
}

+ (instancetype)of_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
  NSString *cleanedHexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
  if (cleanedHexString.length == 6) {
    NSScanner *scanner = [NSScanner scannerWithString:cleanedHexString];
    unsigned rgbValue = 0;
    if ([scanner scanHexInt:&rgbValue]) {
      return [self of_colorWithRed:(rgbValue & 0xFF0000) >> 16 green:(rgbValue & 0xFF00) >> 8 blue:rgbValue & 0xFF alpha:alpha];
    }
  }
  return nil;
}

@end
