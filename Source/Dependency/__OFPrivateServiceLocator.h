#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, __OFPrivateServiceLifetime)
{
  __OFPrivateServiceLifetimeTransient,
  __OFPrivateServiceLifetimeSingleton,
  __OFPrivateServiceLifetimeWeakSingleton
};

@interface __OFPrivateServiceLocator: NSObject

+ (void)registerServiceForWithKey:(NSString *)key lifetime:(__OFPrivateServiceLifetime)lifetime constructor:(id (^)(void))constructor;
+ (id)resolveServiceByKey:(NSString *)key;
+ (BOOL)availableServiceForKey:(NSString *)key;
+ (void)removeServiceForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
