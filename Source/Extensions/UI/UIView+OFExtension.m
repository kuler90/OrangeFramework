#import "UIView+OFExtension.h"

@implementation UIView (OFExtension)

- (void)setOF_cornerRadius:(CGFloat)cornerRadius {
  self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)OF_cornerRadius {
  return self.layer.cornerRadius;
}

- (void)setOF_borderWidth:(CGFloat)borderWidth {
  self.layer.borderWidth = borderWidth;
}

- (CGFloat)OF_borderWidth {
  return self.layer.borderWidth;
}

- (void)setOF_borderColor:(UIColor *)borderColor {
  self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)OF_borderColor {
  return self.layer.borderColor != nil ? [UIColor colorWithCGColor:self.layer.borderColor] : nil;
}

@end
