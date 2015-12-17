#import "UIColor+OFExtension.h"

@implementation UIColor (OFExtension)

+ (instancetype)colorWithHexString:(NSString *)hexString {
  return [self colorWithHexString:hexString alpha:1.0f];
}

+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
  unsigned rgbValue = 0;
  NSScanner *scanner = [NSScanner scannerWithString:hexString];
  [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
  [scanner scanHexInt:&rgbValue];
  return [self colorWithRGBA:(rgbValue & 0xFF0000) >> 16 :(rgbValue & 0xFF00) >> 8 :rgbValue & 0xFF :alpha];
}

@end
