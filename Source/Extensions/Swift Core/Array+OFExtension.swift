
public extension Array {
  
  public func of_safeElement(index: Int) -> Element? {
    return index < count ? self[index] : nil
  }

}

public extension Array where Element: Equatable {
  
  public mutating func of_remove(element: Element) {
    for index in 0..<count where self[index] == element {
      self.removeAtIndex(index)
    }
  }
  
}