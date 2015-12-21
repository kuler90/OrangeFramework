#import <Foundation/Foundation.h>

NS_INLINE BOOL OFRandomBool() {
  return arc4random_uniform(2) == 0;
}

NS_INLINE double OFRandomDoubleBetween(double min, double max) {
  return ((double)arc4random() / UINT32_MAX) * (max - min) + min;
}

NS_INLINE int OFRandomIntBetween(int min, int max) {
  return arc4random_uniform(max - min + 1) + min;
}