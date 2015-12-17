#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (OFExtension)

+ (instancetype)colorWith8BitRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue NS_SWIFT_UNAVAILABLE("Use swift init instead");
+ (instancetype)colorWith8BitRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha NS_SWIFT_UNAVAILABLE("Use swift init instead");

+ (instancetype)colorWithHexString:(NSString *)hexString;
+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
