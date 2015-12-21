#import "NSArray+OFExtension.h"

@implementation NSArray (OFExtension)

- (id)safeObjectAtIndex:(NSUInteger)index {
  return index < self.count ? [self objectAtIndex:index] : nil;
}

@end
