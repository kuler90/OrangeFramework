#import "NSLayoutConstraint+OFExtension.h"

@implementation NSLayoutConstraint (OFExtension)

- (NSInteger)constantPixel {
  return self.constant * [UIScreen mainScreen].scale;
}

- (void)setConstantPixel:(NSInteger)constantPixel {
  self.constant = constantPixel / [UIScreen mainScreen].scale;
}

@end
