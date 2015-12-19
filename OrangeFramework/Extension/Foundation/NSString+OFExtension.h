#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (OFExtension)

- (BOOL)matchRegex:(NSString *)pattern;
- (nullable NSString *)firstMatchOfRegex:(NSString *)pattern;
- (NSArray<NSString *> *)allMatchesOfRegex:(NSString *)pattern;

- (BOOL)matchEmailString;
- (BOOL)matchUrlString;

@end

NS_ASSUME_NONNULL_END