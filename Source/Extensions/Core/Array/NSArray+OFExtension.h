#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (OFExtension)

- (nullable ObjectType)of_safeObjectAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END