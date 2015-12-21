#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSError (OFExtension)

+ (instancetype)errorWithDomainObject:(id)domainObject description:(NSString *)description;
+ (instancetype)errorWithDomainObject:(id)domainObject code:(NSInteger)code description:(NSString *)description;

@end

NS_ASSUME_NONNULL_END
