#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSError (OFExtension)

+ (instancetype)of_errorWithDomainObject:(id)domainObject description:(NSString *)description NS_SWIFT_UNAVAILABLE("Use swift init instead");
+ (instancetype)of_errorWithDomainObject:(id)domainObject code:(NSInteger)code description:(NSString *)description NS_SWIFT_UNAVAILABLE("Use swift init instead");

@end

NS_ASSUME_NONNULL_END
