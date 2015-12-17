#import "NSError+OFExtension.h"

@implementation NSError (OFExtension)

+ (instancetype)errorWithDomainObject:(id)domainObject description:(NSString *)description {
  return [self errorWithDomainObject:domainObject code:0 description:description];
}

+ (instancetype)errorWithDomainObject:(id)domainObject code:(NSInteger)code description:(NSString *)description {
  return [self errorWithDomain:NSStringFromClass([domainObject class]) code:code userInfo:@{NSLocalizedDescriptionKey: description}];
}

@end
