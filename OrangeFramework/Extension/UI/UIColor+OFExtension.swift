import UIKit

public extension UIColor {
  
  public convenience init(_ r: UInt, _ g: UInt, _ b: UInt, _ a: CGFloat = 1.0) {
    self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: a)
  }
  
}
