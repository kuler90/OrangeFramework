#import "UIImage+OFExtension.h"

@implementation UIImage (OFExtension)

+ (instancetype)of_imageWithColor:(UIColor *)color size:(CGSize)size {
  return [self of_imageWithColor:color size:size transparentInsets:UIEdgeInsetsZero];
}

+ (instancetype)of_imageWithColor:(UIColor *)color size:(CGSize)size transparentInsets:(UIEdgeInsets)insets {
  CGRect coloredRect = CGRectMake(insets.left, insets.top, size.width - insets.left - insets.right, size.height - insets.top - insets.bottom);
  UIGraphicsBeginImageContextWithOptions(size, UIEdgeInsetsEqualToEdgeInsets(insets, UIEdgeInsetsZero), 0);
  [color setFill];
  UIRectFill(coloredRect);
  UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return resultImage;
}

+ (instancetype)of_imageFromView:(UIView *)view {
  UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
  [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
  UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return resultImage;
}

@end
