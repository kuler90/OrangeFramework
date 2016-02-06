#import "NSError+OFExtension.h"

@implementation NSError (OFExtension)

+ (instancetype)of_errorWithDomainObject:(id)domainObject description:(NSString *)description {
  return [self of_errorWithDomainObject:domainObject code:0 description:description];
}

+ (instancetype)of_errorWithDomainObject:(id)domainObject code:(NSInteger)code description:(NSString *)description {
  return [self errorWithDomain:NSStringFromClass([domainObject class]) code:code userInfo:@{NSLocalizedDescriptionKey: description}];
}

@end
