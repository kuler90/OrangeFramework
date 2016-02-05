#import "OFDependency.h"
#import "__OFPrivateServiceLocator.h"

@implementation OFDependency

#pragma mark - By Key

+ (void)registerWithKey:(NSString *)key lifetime:(OFDependencyLifetime)lifetime constructor:(id (^)(void))constructor {
  [__OFPrivateServiceLocator registerServiceForWithKey:key lifetime:(NSInteger)lifetime constructor:constructor];
}

+ (id)resolveByKey:(NSString *)key {
  return [__OFPrivateServiceLocator resolveServiceByKey:key];
}

+ (BOOL)availableForKey:(NSString *)key {
  return [__OFPrivateServiceLocator availableServiceForKey:key];
}

+ (void)removeForKey:(NSString *)key {
  [__OFPrivateServiceLocator removeServiceForKey:key];
}

#pragma mark - By Class

+ (void)registerWithClass:(Class)class lifetime:(OFDependencyLifetime)lifetime constructor:(id (^)(void))constructor {
  NSString *dependencyKey = NSStringFromClass(class);
  [self registerWithKey:dependencyKey lifetime:lifetime constructor:constructor];
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

+ (void)registerWithProtocol:(Protocol *)protocol lifetime:(OFDependencyLifetime)lifetime constructor:(id (^)(void))constructor {
  NSString *dependencyKey = NSStringFromProtocol(protocol);
  [self registerWithKey:dependencyKey lifetime:lifetime constructor:constructor];
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
