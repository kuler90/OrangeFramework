#import "NSLayoutConstraint+OFExtension.h"

@implementation NSLayoutConstraint (OFExtension)

- (NSInteger)of_ConstantInPixels {
  return self.constant * [UIScreen mainScreen].scale;
}

- (void)setOf_ConstantInPixels:(NSInteger)constantPixel {
  self.constant = constantPixel / [UIScreen mainScreen].scale;
}

@end
