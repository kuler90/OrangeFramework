#import "__OFPrivateServiceLocator.h"

static NSMutableDictionary *dependencies = nil;
__attribute__((constructor)) static void initializeDependencies(void)
{
  dependencies = [NSMutableDictionary new];
}

@implementation __OFPrivateServiceLocator

+ (void)registerServiceForWithKey:(NSString *)key lifetime:(__OFPrivateServiceLifetime)lifetime constructor:(id (^)(void))constructor {
  id (^resolver)(void);
  switch (lifetime) {
    case __OFPrivateServiceLifetimeTransient:
      resolver = constructor;
      break;
    case __OFPrivateServiceLifetimeSingleton: {
      __block id strongInstance;
      resolver = ^id{
        if (strongInstance) {
          return strongInstance;
        } else {
          strongInstance = constructor();
          return strongInstance;
        }
      };
      break;
    }
    case __OFPrivateServiceLifetimeWeakSingleton: {
      __weak __block id weakInstance;
      resolver = ^id{
        if (weakInstance) {
          return weakInstance;
        } else {
          id strongInstance = constructor();
          weakInstance = strongInstance;
          return strongInstance;
        }
      };
      break;
    }
  }
  dependencies[key] = [resolver copy];
}

+ (id)resolveServiceByKey:(NSString *)key {
  id (^resolver)(void) = dependencies[key];
  NSAssert(resolver, @"No registration for key %@", key);
  return resolver();
}

+ (BOOL)availableServiceForKey:(NSString *)key {
  return dependencies[key] != nil;
}

+ (void)removeServiceForKey:(NSString *)key {
  dependencies[key] = nil;
}


@end
