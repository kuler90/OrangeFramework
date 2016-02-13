import UIKit

// MARK: - CGPoint

public extension CGPoint {
  
  public func of_with(x x: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
  }
  
  public func of_with(y y: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
  }
  
}

// MARK: - CGSize

public extension CGSize {
  
  public func of_with(width width: CGFloat) -> CGSize {
    return CGSize(width: width, height: height)
  }
  
  public func of_with(height height: CGFloat) -> CGSize {
    return CGSize(width: width, height: height)
  }
  
}

// MARK: - CGRect

public extension CGRect {
  
  public func of_with(x x: CGFloat) -> CGRect {
    return CGRect(x: x, y: minY, width: width, height: height)
  }
  
  public func of_with(y y: CGFloat) -> CGRect {
    return CGRect(x: minX, y: y, width: width, height: height)
  }
  
  public func of_with(width width: CGFloat) -> CGRect {
    return CGRect(x: minX, y: minY, width: width, height: height)
  }
  
  public func of_with(height height: CGFloat) -> CGRect {
    return CGRect(x: minX, y: minY, width: width, height: height)
  }
  
  public func of_with(midX midX: CGFloat) -> CGRect {
    return CGRect(x: midX - width * 0.5, y: minY, width: width, height: height)
  }
  
  public func of_with(midY midY: CGFloat) -> CGRect {
    return CGRect(x: minX, y: midY - height * 0.5, width: width, height: height)
  }
  
  public func of_with(maxX maxX: CGFloat) -> CGRect {
    return CGRect(x: maxX - width, y: minY, width: width, height: height)
  }
  
  public func of_with(maxY maxY: CGFloat) -> CGRect {
    return CGRect(x: minX, y: maxY - height, width: width, height: height)
  }
  
}

// MARK: - CGVector

public extension CGVector {
  
  public func of_with(dx dx: CGFloat) -> CGVector {
    return CGVector(dx: dx, dy: dy)
  }
  
  public func of_with(dy dy: CGFloat) -> CGVector {
    return CGVector(dx: dx, dy: dy)
  }
  
}

// MARK: - UIOffset

public extension UIOffset {
  
  public func of_with(horizontal horizontal: CGFloat) -> UIOffset {
    return UIOffset(horizontal: horizontal, vertical: vertical)
  }
  
  public func of_with(vertical vertical: CGFloat) -> UIOffset {
    return UIOffset(horizontal: horizontal, vertical: vertical)
  }

}

// MARK: - UIEdgeInsets

public extension UIEdgeInsets {
  
  public func of_with(top top: CGFloat) -> UIEdgeInsets {
    return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
  }
  
  public func of_with(left left: CGFloat) -> UIEdgeInsets {
    return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
  }
  
  public func of_with(bottom bottom: CGFloat) -> UIEdgeInsets {
    return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
  }
  
  public func of_with(right right: CGFloat) -> UIEdgeInsets {
    return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
  }
  
}