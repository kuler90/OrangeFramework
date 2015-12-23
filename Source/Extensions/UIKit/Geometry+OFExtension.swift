import UIKit

// MARK: - CGPoint

public extension CGPoint {
  
  public func with(x x: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
  }
  
  public func with(y y: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
  }
  
}

// MARK: - CGSize

public extension CGSize {
  
  public func with(width width: CGFloat) -> CGSize {
    return CGSize(width: width, height: height)
  }
  
  public func with(height height: CGFloat) -> CGSize {
    return CGSize(width: width, height: height)
  }
  
}

// MARK: - CGRect

public extension CGRect {
  
  public var x: CGFloat {
    get { return origin.x }
  }

  public var y: CGFloat {
    get { return origin.y }
  }
  
  public func with(x x: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
  }
  
  public func with(y y: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
  }
  
  public func with(width width: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
  }
  
  public func with(height height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
  }
  
  public func with(midX midX: CGFloat) -> CGRect {
    return CGRect(x: midX - width * 0.5, y: y, width: width, height: height)
  }
  
  public func with(midY midY: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: midY - height * 0.5)
  }
  
  public func with(maxX maxX: CGFloat) -> CGRect {
    return CGRect(x: maxX - width, y: y, width: width, height: height)
  }
  
  public func with(maxY maxY: CGFloat) -> CGRect {
    return CGRect(x: x, y: maxY - height, width: width, height: height)
  }
  
}

// MARK: - CGVector

public extension CGVector {
  
  public func with(dx dx: CGFloat) -> CGVector {
    return CGVector(dx: dx, dy: dy)
  }
  
  public func with(dy dy: CGFloat) -> CGVector {
    return CGVector(dx: dx, dy: dy)
  }
  
}

// MARK: - UIOffset

public extension UIOffset {
  
  public func with(horizontal horizontal: CGFloat) -> UIOffset {
    return UIOffset(horizontal: horizontal, vertical: vertical)
  }
  
  public func with(vertical vertical: CGFloat) -> UIOffset {
    return UIOffset(horizontal: horizontal, vertical: vertical)
  }

}

// MARK: - UIEdgeInsets

public extension UIEdgeInsets {
  
  public func with(top top: CGFloat) -> UIEdgeInsets {
    return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
  }
  
  public func with(left left: CGFloat) -> UIEdgeInsets {
    return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
  }
  
  public func with(bottom bottom: CGFloat) -> UIEdgeInsets {
    return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
  }
  
  public func with(right right: CGFloat) -> UIEdgeInsets {
    return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
  }
  
}