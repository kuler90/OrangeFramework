#import "NSLayoutConstraint+OFExtension.h"

@implementation NSLayoutConstraint (OFExtension)

- (NSInteger)OF_constantInPixels {
  return self.constant * [UIScreen mainScreen].scale;
}

- (void)setOF_constantInPixels:(NSInteger)constantPixel {
  self.constant = constantPixel / [UIScreen mainScreen].scale;
}

@end
