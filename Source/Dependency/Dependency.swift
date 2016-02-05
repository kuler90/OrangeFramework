import Foundation

private final class Box<T> {
  let value: T
  init(_ value: T) {
    self.value = value
  }
}

public enum DependencyLifetime: Int {
  case Transient
  case Singleton
  case WeakSingleton
}

public class Dependency {
  
  // MARK: - By Key
  
  public class func register(key: String, lifetime: DependencyLifetime, constructor: () -> Any) {
    __OFPrivateServiceLocator.registerServiceForWithKey(key, lifetime: __OFPrivateServiceLifetime(rawValue: lifetime.rawValue)!, constructor: { Box(constructor()) })
  }
  
  public class func resolve(key: String) -> Any {
    let instance = __OFPrivateServiceLocator.resolveServiceByKey(key)
    return (instance as? Box<Any>)?.value ?? instance
  }
  
  public class func available(key: String) -> Bool {
    return __OFPrivateServiceLocator.availableServiceForKey(key)
  }
  
  public class func remove(key: String) {
    return __OFPrivateServiceLocator.removeServiceForKey(key)
  }
  
  // MARK: - By Type
  
  public class func register<T: Any>(type: T.Type, lifetime: DependencyLifetime, constructor: () -> T) {
    let dependencyKey = String(reflecting: T.self)
    register(dependencyKey, lifetime: lifetime, constructor: constructor)
  }
  
  public class func resolve<T: Any>(type: T.Type = T.self) -> T {
    let dependencyKey = String(reflecting: T.self)
    let instance = resolve(dependencyKey) as? T
    assert(instance != nil, "Resolved object is not kind of type \(dependencyKey)")
    return instance!
  }
  
  public class func available<T: Any>(type: T.Type) -> Bool {
    let dependencyKey = String(reflecting: T.self)
    return available(dependencyKey)
  }

  public class func remove<T: Any>(type: T.Type) {
    let dependencyKey = String(reflecting: T.self)
    return remove(dependencyKey)
  }

}