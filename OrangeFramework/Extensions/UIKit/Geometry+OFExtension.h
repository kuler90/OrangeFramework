#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - CGPoint

NS_INLINE CGPoint CGPointModify(CGPoint point, void (^modifyBlock)(CGPoint *point)) {
  modifyBlock(&point);
  return point;
}

#pragma mark - CGSize

NS_INLINE CGSize CGSizeModify(CGSize size, void (^modifyBlock)(CGSize *size)) {
  modifyBlock(&size);
  return size;
}

#pragma mark - CGRect

NS_INLINE CGFloat CGRectGetX(CGRect rect) {
  return rect.origin.x;
}

NS_INLINE CGFloat CGRectGetY(CGRect rect) {
  return rect.origin.y;
}

NS_INLINE CGRect CGRectModify(CGRect rect, void (^modifyBlock)(CGRect *rect)) {
  modifyBlock(&rect);
  return rect;
}

#pragma mark - CGVector

NS_INLINE CGVector CGVectorModify(CGVector vector, void (^modifyBlock)(CGVector *vector)) {
  modifyBlock(&vector);
  return vector;
}

#pragma mark - UIOffset

NS_INLINE UIOffset UIOffsetModify(UIOffset offset, void (^modifyBlock)(UIOffset *offset)) {
  modifyBlock(&offset);
  return offset;
}

#pragma mark - UIEdgeInsets

NS_INLINE UIEdgeInsets UIEdgeInsetsModify(UIEdgeInsets insets, void (^modifyBlock)(UIEdgeInsets *insets)) {
  modifyBlock(&insets);
  return insets;
}

NS_ASSUME_NONNULL_END

