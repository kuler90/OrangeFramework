#import "UIView+OFExtension.h"

@implementation UIView (OFExtension)

- (void)setOf_CornerRadius:(CGFloat)cornerRadius {
  self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)of_CornerRadius {
  return self.layer.cornerRadius;
}

- (void)setOf_BorderWidth:(CGFloat)borderWidth {
  self.layer.borderWidth = borderWidth;
}

- (CGFloat)of_BorderWidth {
  return self.layer.borderWidth;
}

- (void)setOf_BorderColor:(UIColor *)borderColor {
  self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)of_BorderColor {
  return self.layer.borderColor != nil ? [UIColor colorWithCGColor:self.layer.borderColor] : nil;
}

@end
