#import "UIColor+OFExtension.h"

@implementation UIColor (OFExtension)

+ (instancetype)colorWith8BitRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue {
  return [self colorWith8BitRed:red green:green blue:blue alpha:1.0f];
}

+ (instancetype)colorWith8BitRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha {
  return [self colorWithRed:red/256.0f green:green/256.0f blue:blue/256.0f alpha:alpha];
}

+ (instancetype)colorWithHexString:(NSString *)hexString {
  return [self colorWithHexString:hexString alpha:1.0f];
}

+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
  unsigned rgbValue = 0;
  NSScanner *scanner = [NSScanner scannerWithString:hexString];
  [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
  if ([scanner scanHexInt:&rgbValue] && [NSString stringWithFormat:@"%x",rgbValue].length == 6) {
    return [self colorWith8BitRed:(rgbValue & 0xFF0000) >> 16 green:(rgbValue & 0xFF00) >> 8 blue:rgbValue & 0xFF alpha:alpha];
  } else {
    return nil;
  }
}

@end
