#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (OFExtension)

+ (instancetype)of_imageWithColor:(UIColor *)color size:(CGSize)size NS_SWIFT_NAME(init(color:size:));
+ (instancetype)of_imageWithColor:(UIColor *)color size:(CGSize)size transparentInsets:(UIEdgeInsets)insets NS_SWIFT_NAME(init(color:size:transparentInsets:));

+ (instancetype)of_imageFromView:(UIView *)view NS_SWIFT_NAME(init(view:));

@end

NS_ASSUME_NONNULL_END