#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (OFExtension)

+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size transparentInsets:(UIEdgeInsets)insets;

+ (instancetype)imageFromView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END