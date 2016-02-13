#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_UNAVAILABLE("OFDependency not available. Use Dependency instead")
typedef NS_ENUM(NSInteger, OFDependencyLifetime)
{
  OFDependencyLifetimeTransient,
  OFDependencyLifetimeSingleton,
  OFDependencyLifetimeWeakSingleton
};

NS_SWIFT_UNAVAILABLE("Use Dependency instead")
@interface OFDependency : NSObject 

+ (void)registerWithKey:(NSString *)key lifetime:(OFDependencyLifetime)lifetime constructor:(id (^)(void))constructor;
+ (id)resolveByKey:(NSString *)key;
+ (BOOL)availableForKey:(NSString *)key;
+ (void)removeForKey:(NSString *)key;

+ (void)registerWithClass:(Class)class lifetime:(OFDependencyLifetime)lifetime constructor:(id (^)(void))constructor;
+ (id)resolveByClass:(Class)class;
+ (BOOL)availableForClass:(Class)class;
+ (void)removeForClass:(Class)class;

+ (void)registerWithProtocol:(Protocol *)protocol lifetime:(OFDependencyLifetime)lifetime constructor:(id (^)(void))constructor;
+ (id)resolveByProtocol:(Protocol *)protocol;
+ (BOOL)availableForProtocol:(Protocol *)protocol;
+ (void)removeForProtocol:(Protocol *)protocol;

@end

NS_ASSUME_NONNULL_END