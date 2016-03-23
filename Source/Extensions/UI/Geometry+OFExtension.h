#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - CGPoint

NS_INLINE CGPoint OFPointModify(CGPoint point, void (^modifyBlock)(CGPoint *point)) {
  modifyBlock(&point);
  return point;
}

#pragma mark - CGSize

NS_INLINE CGSize OFSizeModify(CGSize size, void (^modifyBlock)(CGSize *size)) {
  modifyBlock(&size);
  return size;
}

#pragma mark - CGRect

NS_INLINE CGFloat OFRectGetX(CGRect rect) {
  return rect.origin.x;
}

NS_INLINE CGFloat OFRectGetY(CGRect rect) {
  return rect.origin.y;
}

NS_INLINE CGRect OFRectModify(CGRect rect, void (^modifyBlock)(CGRect *rect)) {
  modifyBlock(&rect);
  return rect;
}

#pragma mark - CGVector

NS_INLINE CGVector OFVectorModify(CGVector vector, void (^modifyBlock)(CGVector *vector)) {
  modifyBlock(&vector);
  return vector;
}

#pragma mark - UIOffset

NS_INLINE UIOffset OFOffsetModify(UIOffset offset, void (^modifyBlock)(UIOffset *offset)) {
  modifyBlock(&offset);
  return offset;
}

#pragma mark - UIEdgeInsets

NS_INLINE UIEdgeInsets OFEdgeInsetsModify(UIEdgeInsets insets, void (^modifyBlock)(UIEdgeInsets *insets)) {
  modifyBlock(&insets);
  return insets;
}

NS_ASSUME_NONNULL_END

