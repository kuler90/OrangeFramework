public extension Array {

  public subscript(safe index: Index) -> Element? {
    return index < count ? self[index] : nil
  }
  
  public func indexOfObject<T: Equatable>(element: T) -> Int? {
    for index in 0..<count {
      if let e = self[index] as? T where e == element {
        return index
      }
    }
    return nil
  }
  
  public mutating func remove<T: Equatable>(element: T) {
    for index in 0..<count {
      if let e = self[index] as? T where e == element {
        self.removeAtIndex(index)
      }
    }
  }
  
}