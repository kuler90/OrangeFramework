#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, OFDependencyMode)
{
  OFDependencyModeFactory,
  OFDependencyModeSingleton,
  OFDependencyModeWeakSingleton
};

@interface OFDependency : NSObject

+ (void)registerWithKey:(NSString *)key mode:(OFDependencyMode)mode constructor:(id (^)(void))constructor;
+ (id)resolveByKey:(NSString *)key;
+ (BOOL)availableForKey:(NSString *)key;
+ (void)removeForKey:(NSString *)key;

+ (void)registerWithClass:(Class)class mode:(OFDependencyMode)mode constructor:(id (^)(void))constructor NS_SWIFT_UNAVAILABLE("Use swift extension methods instead");
+ (id)resolveByClass:(Class)class NS_SWIFT_UNAVAILABLE("Use swift extension methods instead");
+ (BOOL)availableForClass:(Class)class NS_SWIFT_UNAVAILABLE("Use swift extension methods instead");
+ (void)removeForClass:(Class)class NS_SWIFT_UNAVAILABLE("Use swift extension methods instead");

+ (void)registerWithProtocol:(Protocol *)protocol mode:(OFDependencyMode)mode constructor:(id (^)(void))constructor NS_SWIFT_UNAVAILABLE("Use swift extension methods instead");
+ (id)resolveByProtocol:(Protocol *)protocol NS_SWIFT_UNAVAILABLE("Use swift extension methods instead");
+ (BOOL)availableForProtocol:(Protocol *)protocol NS_SWIFT_UNAVAILABLE("Use swift extension methods instead");
+ (void)removeForProtocol:(Protocol *)protocol NS_SWIFT_UNAVAILABLE("Use swift extension methods instead");

@end

NS_ASSUME_NONNULL_END