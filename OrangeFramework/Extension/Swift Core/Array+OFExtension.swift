public extension Array {

  public subscript(safe index: Index) -> Element? {
    return index < count ? self[index] : nil
  }
  
}