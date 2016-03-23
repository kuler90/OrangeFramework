#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (OFExtension)

- (NSTimeInterval)of_readingTime; // speed is 200
- (NSTimeInterval)of_readingTimeWithSpeed:(NSUInteger)speed; // speed is words per minute

- (BOOL)of_matchRegex:(NSString *)pattern;
- (nullable NSString *)of_firstMatchOfRegex:(NSString *)pattern;
- (NSArray<NSString *> *)of_allMatchesOfRegex:(NSString *)pattern;

- (BOOL)of_matchEmailString;
- (BOOL)of_matchUrlString;

@end

NS_ASSUME_NONNULL_END