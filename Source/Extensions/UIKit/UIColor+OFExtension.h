#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (OFExtension)

+ (instancetype)of_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue NS_SWIFT_NAME(init(_:_:_:));
+ (instancetype)of_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha NS_SWIFT_NAME(init(_:_:_:_:));

+ (nullable instancetype)of_colorWithHexString:(NSString *)hexString NS_SWIFT_NAME(init(of_hexString:));
+ (nullable instancetype)of_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha NS_SWIFT_NAME(init(of_hexString:alpha:));

@end

NS_ASSUME_NONNULL_END
