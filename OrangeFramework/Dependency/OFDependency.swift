import Foundation

private final class Box<T> {
  let value: T
  init(_ value: T) {
    self.value = value
  }
}

public extension OFDependency {
  
  // MARK: - By Type
  
  public class func registerWithType<T: Any>(type: T.Type, mode: OFDependencyMode, constructor: () -> T) {
    let dependencyKey = String(reflecting: T.self)
    registerWithKey(dependencyKey, mode: mode) {
      return Box(constructor())
    }
  }
  
  public class func resolveByType<T: Any>(type: T.Type = T.self) -> T {
    let dependencyKey = String(reflecting: T.self)
    let instanceBox = resolveByKey(dependencyKey) as? Box<T>
    assert(instanceBox != nil, "Resolved object is not kind of type \(dependencyKey)")
    return instanceBox!.value
  }
  
  public class func availableForType<T: Any>(type: T.Type) -> Bool {
    let dependencyKey = String(reflecting: T.self)
    return availableForKey(dependencyKey)
  }
  
  public class func removeForType<T: Any>(type: T.Type) {
    let dependencyKey = String(reflecting: T.self)
    return removeForKey(dependencyKey)
  }

}
