#import "NSArray+OFExtension.h"

@implementation NSArray (OFExtension)

- (id)of_safeObjectAtIndex:(NSUInteger)index {
  return index < self.count ? [self objectAtIndex:index] : nil;
}

@end
