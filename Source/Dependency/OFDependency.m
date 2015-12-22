#import "OFDependency.h"

static NSMutableDictionary *dependencies = nil;

@implementation OFDependency

+ (void)initialize {
  static dispatch_once_t once;
  dispatch_once(&once, ^{
    dependencies = [NSMutableDictionary new];
  });
}

#pragma mark - By Key

+ (void)registerWithKey:(NSString *)key mode:(OFDependencyMode)mode constructor:(id (^)(void))constructor {
  id (^resolver)(void);
  switch (mode) {
    case OFDependencyModeFactory:
      resolver = constructor;
      break;
    case OFDependencyModeSingleton: {
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
    case OFDependencyModeWeakSingleton: {
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

+ (id)resolveByKey:(NSString *)key {
  id (^resolver)(void) = dependencies[key];
  NSAssert(resolver, @"No registration for key %@", key);
  return resolver();
}

+ (BOOL)availableForKey:(NSString *)key {
  return dependencies[key] != nil;
}

+ (void)removeForKey:(NSString *)key {
  dependencies[key] = nil;
}

#pragma mark - By Class

+ (void)registerWithClass:(Class)class mode:(OFDependencyMode)mode constructor:(id (^)(void))constructor {
  NSString *dependencyKey = NSStringFromClass(class);
  [self registerWithKey:dependencyKey mode:mode constructor:constructor];
}

+ (id)resolveByClass:(Class)class {
  NSString *dependencyKey = NSStringFromClass(class);
  id instance = [self resolveByKey:dependencyKey];
  NSAssert([instance isKindOfClass:class], @"Resolved instance is not kind of class %@", dependencyKey);
  return instance;
}

+ (BOOL)availableForClass:(Class)class {
  NSString *dependencyKey = NSStringFromClass(class);
  return [self availableForKey:dependencyKey];
}

+ (void)removeForClass:(Class)class {
  NSString *dependencyKey = NSStringFromClass(class);
  [self removeForKey:dependencyKey];
}

#pragma mark - By Protocol

+ (void)registerWithProtocol:(Protocol *)protocol mode:(OFDependencyMode)mode constructor:(id (^)(void))constructor {
  NSString *dependencyKey = NSStringFromProtocol(protocol);
  [self registerWithKey:dependencyKey mode:mode constructor:constructor];
}

+ (id)resolveByProtocol:(Protocol *)protocol {
  NSString *dependencyKey = NSStringFromProtocol(protocol);
  id instance = [self resolveByKey:dependencyKey];
  NSAssert([instance conformsToProtocol:protocol], @"Resolved instance not conforms to protocol %@", dependencyKey);
  return instance;
}

+ (BOOL)availableForProtocol:(Protocol *)protocol {
  NSString *dependencyKey = NSStringFromProtocol(protocol);
  return [self availableForKey:dependencyKey];
}

+ (void)removeForProtocol:(Protocol *)protocol {
  NSString *dependencyKey = NSStringFromProtocol(protocol);
  [self removeForKey:dependencyKey];
}

@end
